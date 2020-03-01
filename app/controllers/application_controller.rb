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
    erb :index
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end


end
