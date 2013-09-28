env = ENV["RACK_ENV"] || "development"
#this tells datamapper to use postgres on localhost.
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
#after declaring models you need to finalize them
DataMapper.finalize

#Removing below because Rakefile now in place to run .auto_upgrade or .auto_migrate as needed
#DataMapper.auto_upgrade!

# auto_upgrade makes non-destructive changes. It your tables don't exist, they will be created
# but if they do and you changed your schema (e.g. changed the type of one of the properties)
# they will not be upgraded because that'd lead to data loss.
# To force the creation of all tables as they are described in your models, even if this
# leads to data loss, use auto_migrate:
# DataMapper.auto_migrate!
# Finally, don't forget that before you do any of that stuff, you need to create a database first.