class GameController < ApplicationController 


    get '/games' do 
        erb :'/games/games'
    end

    get '/games/new' do 
        erb :'/games/new'
    end
end