class UserController < ApplicationController

        get "/signup" do 
            erb :'/user/signup'
        end

        post "/signup" do 
            #need to check if username is unique and password parameters
            user = User.new(:username => params[:username], :password => params[:password])
            if user[:username].empty? || user[:password_digest] == nil
                redirect "/failure"
            end
            user.save
            redirect "/login"
        end

        get '/login' do
            erb :'/user/login'
        end

        post "/login" do
            user = User.find_by(:username => params[:username])
            if user && user.authenticate(params[:password])
              session[:user_id] = user.id
              redirect "/account"
            else
              redirect "/"
            end
        end

        get '/account' do 
            erb :'/user/account'
        end

end