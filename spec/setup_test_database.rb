require 'data_mapper'
require 'dm-postgres-adapter'

def setup_test_database
  if ENV['ENVIRONMENT'] == 'test'
    DataMapper.setup(
      :default, 'postgres://:@localhost/makers_bnb_test'
    )
  else
  DataMapper.setup(
    :default, 'postgres://:@localhost/makers_bnb'
  )
  end
end

DataMapper.finalize
#DataMapper.auto_migrate!
DataMapper.auto_upgrade!
