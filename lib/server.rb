require 'sinatra'
require 'data_mapper'

env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './lib/link'
require './lib/tag'

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
	@links = Link.all
	erb :index
end

tags = params["tags"].split(" ").map do |tag|
  # this will either find this tag or create
  # it if it doesn't exist already
  Tag.first_or_create(:text => tag)
end
Link.create(:url => url, :title => title, :tags => tags)

