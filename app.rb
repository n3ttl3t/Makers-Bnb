require 'sinatra/base'
require_relative 'dmconfig.rb'

class Makers_BnB < Sinatra::Base
  get('/') do
    erb :index
  end

  post('/user') do
  end

  run! if app_file == $0
end
