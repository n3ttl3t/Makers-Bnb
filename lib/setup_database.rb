require './lib/user'
require './lib/space'

  if ENV['ENVIRONMENT'] == 'test'
    p 'should be in test db'
    DataMapper.setup(
      :default, 'postgres://:@localhost/makers_bnb_test'
    )
  else
    p 'should be in dev database'
    DataMapper.setup(
      :default, 'postgres://:@localhost/makers_bnb'
  )
  end

DataMapper.finalize
DataMapper.auto_upgrade!
