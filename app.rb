require 'rubygems'
require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'

require './lib/setup_database'
require './lib/space'
require './lib/user'

class Makers_BnB < Sinatra::Base
  enable :sessions

  setup_database

  get('/') do
    erb :index
  end

  post "/" do
    @user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect "/spaces"
  end

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

  run! if app_file == $0
end
