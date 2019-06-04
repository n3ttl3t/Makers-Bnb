require 'data_mapper' # requires all the gems listed above
require 'dm-postgres-adapter'
require_relative './space.rb'

if ENV['ENVIRONMENT'] == 'test'
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
