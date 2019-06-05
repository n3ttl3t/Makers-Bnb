# require 'rubygems'
require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/flash'

require './lib/setup_database'
require './lib/space'
require './lib/user'

class Makers_BnB < Sinatra::Base

  configure :development do
    register Sinatra::Flash
  end

  enable :sessions

  get('/') do
    erb :index
  end

  post '/sessions' do
    user = User.all(:username => params[:username]) & User.all(:password => params[:password])
    if user.any?
      session[:user_id] = user[0].id
      redirect '/spaces'
    else
      flash[:notice] = 'The username and password that you entered did not match our records. Please double-check and try again.'
      redirect '/'
    end
  end

  get "/signup" do
    erb :signup
  end

  post "/signup" do
    @user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = @user.id
    redirect "/spaces"
  end

  get '/spaces' do
    @current_user = User.get(session[:user_id])
    @spaces = Space.all :order => :id.desc
    erb :spaces
  end

  get '/spaces/new' do
    erb :spaces_new
  end

  post '/spaces/new' do
    p User.get(session[:user_id]).id 
    Space.create(name: params[:name], description: params[:description], price: params[:price], available_from: params[:available_from], available_to: params[:available_to], user_id: (User.get(session[:user_id])).id)
    redirect '/spaces'
  end

  run! if app_file == $0
end
