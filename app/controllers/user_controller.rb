class UserController < ApplicationController

    get "/signup" do
        erb :'/user/signup'
    end

    post "/signup" do
        #Checks for blank username/password
        user = User.new(:username => params[:username], :password => params[:password])
        if user[:username].empty? || user[:password_digest] == nil
            flash[:alert] = "Invalid username and/or password"
            redirect "/signup"
        #Checks if username is taken
        elsif User.find_by(:username => user[:username])
            flash[:alert] = "Username already taken"
            redirect "/signup"
        #Checks if password is 8-15 alphanumeric characters
        elsif params[:password].match(/^[a-zA-Z0-9]{8,15}$/) == nil
            flash[:alert] = "Password must be between 8-15 Alphanumeric Characters"
            redirect "/signup"
        end
        user.wishlist = Wishlist.new
        user.save
        flash[:message] = "New account created!"
        redirect "/"
    end

    get '/' do
        erb :'login'
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