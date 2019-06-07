require_relative 'user'

class Space
   include DataMapper::Resource

   property :id,             Serial
   property :name,           String, :required => true, :unique => true
   property :description,    Text, :required => true
   property :price,          String, :required => true
   property :available_from, Date, :required => true
   property :available_to,   Date, :required => true
   belongs_to :user

end
