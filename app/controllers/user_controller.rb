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
            binding.pry
            redirect "/login"
        end
end