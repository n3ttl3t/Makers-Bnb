require 'data_mapper' # requires all the gems listed above
require 'dm-postgres-adapter'
require './lib/user.rb'

if ENV['RACK_ENV'] == 'test'
 DataMapper.setup(
   :default, 'postgres://:@localhost/makers_bnb_test'
 )
else
 DataMapper.setup(
   :default, 'postgres://:@localhost/makers_bnb'
 )
end

DataMapper.finalize
DataMapper.auto_upgrade!
