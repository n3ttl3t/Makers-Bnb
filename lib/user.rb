require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'space'

class User
    include DataMapper::Resource

    property :id,             Serial
    property :name,           String, :required => true
    property :username,       String, :required => true, :unique => true
    property :email,          String, :required => true, :unique => true
    property :password,       String, :required => true

    has n, :space

end
