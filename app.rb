require 'sinatra/base'
require 'pg'

require './lib/space'
require './lib/dmconfig'

class Makers_BnB < Sinatra::Base

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  get '/spaces/new' do
    erb :spaces_new
  end

  post '/spaces/new' do
    Space.create(params[:name], params[:description], params[:price])
    redirect 'spaces'
  end


end
