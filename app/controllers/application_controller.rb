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

    def params_check? 
      if params[:game][:name].empty?
        flash[:alert] = "Name field cannot be left blank"
        return false
      elsif params[:game][:year_published].match(/^[0-9]{4}/) == nil && !params[:game][:year_published].empty?
        flash[:alert] = "Invalid year published"
        return false
      elsif params[:game][:player_count].match(/^[0-9]+-*[0-9]*$/) == nil && !params[:game][:player_count].empty?
        flash[:alert] = "Invalid player count"
        return false
      elsif params[:game][:playing_time].match(/^[0-9]+-*[0-9]*\s+min$/) == nil && !params[:game][:playing_time].empty?
        flash[:alert] = "Invalid playing time"
        return false
      elsif params[:game][:img_url].match(/^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/m) == nil && !params[:game][:img_url].empty?
        flash[:alert] = "Invalid image url"
        return false 
      else 
        return true
      end
    end 
  end


end
