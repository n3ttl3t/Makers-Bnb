require_relative "user"
require_relative "space"

class Booking
   include DataMapper::Resource

   property :id,            Serial
   property :name,          String
   property :confirmed,     String#, :required => true, :default => false
   belongs_to :space
   belongs_to :user

end
