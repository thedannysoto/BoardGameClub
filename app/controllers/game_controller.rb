class GameController < ApplicationController 


    get '/games' do 
        if logged_in?
            @user = current_user
            erb :'/games/games'
        else 
            flash[:alert] = "You must be logged in to view that page."
            erb :'/user/login'
        end 
    end

    get '/games/new' do 
        erb :'/games/new'
    end

    post '/games' do 
        if params[:game][:name].empty?
            flash[:alert] = "Name field cannot be left blank."
            redirect '/games/new'
        end
        game = Game.new(params[:game])
        game.users << current_user
        game.save
        redirect '/games'
    end
end