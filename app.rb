# require 'rubygems'
require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/flash'

require './lib/space'
require './lib/user'
require './lib/booking'
require './lib/setup_database'


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
    session[:spaces] = Space.all :order => :id.desc
    @confirmed_bookings = Booking.all(confirmed: true)
    @spaces = session[:spaces]
    erb :spaces
  end

  get '/spaces/new' do
    erb :spaces_new
  end

  post '/spaces/new' do
    @space = Space.create(name: params[:name], description: params[:description], price: params[:price], available_from: params[:available_from], available_to: params[:available_to], user_id: (User.get(session[:user_id])).id)
     if !Space.all(:name => params[:name]).any?
      flash[:notice] = 'You entered an invalid date format. Please try again.'
      redirect "/spaces/new"
     else
      redirect '/spaces'
     end
  end

  post "/bookings/new" do
    if session[:user_id] == params[:space_user_id].to_i
     flash[:notice] = "You can't book your own space!"    
     redirect "/spaces"
    else
      Booking.create(name: params[:booking_name], confirmed: "false", space_id: params[:booking_id], user_id: session[:user_id])
      redirect "/bookings/requests"
    end
  end

  get "/bookings/requests" do
    erb :booking_requests
  end

  get "/bookings/review" do
     @bookings = Space.all(user_id: session[:user_id])
     @unconfirmed_bookings = Booking.all(confirmed: false)
     erb :bookings_review
   end

  post "/bookings/update" do
    Booking.all(id: params[:booking_id]).update(:confirmed => 'true')
    redirect "/bookings/confirmation"
  end

  get "/bookings/confirmation" do
    erb :booking_confirmation
  end

  run! if app_file == $0
end
