require './config/environment'
require 'securerandom'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :index
  end


end
