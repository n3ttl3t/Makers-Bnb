require 'sinatra/base'
require_relative 'dmconfig.rb'

class Makers_BnB < Sinatra::Base
  get('/') do
    erb :index
  end

  post('/user') do
  end

end
