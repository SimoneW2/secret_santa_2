require 'data_mapper'

env = ENV['ENVIRONMENT'] || 'development'


# we're telling datamapper to use a postgres database on localhost. The name will be 'secret_santa2_test' or 'secret_santa2_developmemt' depending on the environment
DataMapper.setup(:default, "postgres://localhost/secret_santa_2_#{env}")

# require each model individually - the path may vary depending on your file structure.
require './lib/participant'

# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!
