require 'sinatra/base'
require_relative 'dmconfig.rb'

class Makers_BnB < Sinatra::Base
  get('/') do
    erb :index
  end

  post "/" do
    @user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect "/spaces"
   end

  get '/spaces' do
    "works"
  end

  run! if app_file == $0
end
