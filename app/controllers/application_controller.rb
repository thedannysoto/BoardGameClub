require './config/environment'
require 'securerandom'
require 'rack-flash'
class ApplicationController < Sinatra::Base
  
  use Rack::Flash

 
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET')
    set :public_folder, 'public'
    set :views, 'app/views'


  get "/" do
    erb :login
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def not_logged_in
      flash[:alert] = "You must be logged in to view that page"
        redirect '/'
    end
  end


end
