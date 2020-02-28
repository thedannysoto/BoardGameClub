class User < ActiveRecord::Base 
    has_many :user_games 
    has_many :games, through: :user_games
end