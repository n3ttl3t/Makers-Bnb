require 'sinatra/base'
require 'pg'

require './lib/space'
require './lib/dmconfig'

class Makers_BnB < Sinatra::Base

  get '/spaces' do
    @spaces = Space.all :order => :id.desc
    erb :spaces
  end

  get '/spaces/new' do
    erb :spaces_new
  end

  post '/spaces/new' do
    Space.create(name: params[:name], description: params[:description], price: params[:price])
    redirect '/spaces'
  end

end
