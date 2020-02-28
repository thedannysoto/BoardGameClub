class GameController < ApplicationController 


    get '/games' do 
        erb :'/games/games'
    end

    get '/games/new' do 
        erb :'/games/new'
    end

    post '/games' do 
        #Update: raise error if Game has no name
        game = Game.new(:name => params[:name])
        game.save
        redirect '/games'
    end
end