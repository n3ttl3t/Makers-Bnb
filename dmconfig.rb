require 'rubygems'
require 'data_mapper' # requires all the gems listed above
require 'dm-postgres-adapter'

DataMapper.setup(:default, 'postgres://localhost/makers_bnb')

#require_relative 'user.rb'

DataMapper.finalize
DataMapper.auto_upgrade!
