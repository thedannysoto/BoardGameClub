class UserController < ApplicationController

    get "/signup" do
        erb :'/user/signup'
    end

    post "/signup" do 
        #need to check if username is unique and password parameters
        user = User.new(:username => params[:username], :password => params[:password])
        if user[:username].empty? || user[:password_digest] == nil
            flash[:alert] = "Invalid username and/or password"
            redirect "/signup"
        end
        user.wishlist = Wishlist.new
        user.save
        flash[:message] = "New account created!"
        redirect "/"
    end

    get '/' do
        erb :'index'
    end

    post "/login" do
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/games"
        else
            flash[:alert] = "Invalid username and/or password."
            redirect '/'
        end
    end

    get "/logout" do
        session.clear
        redirect "/"
      end

end