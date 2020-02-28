class UserController < ApplicationController

        get "/signup" do 
            erb :'/user/signup'
        end
end