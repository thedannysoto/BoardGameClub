class User < ActiveRecord::Base 
    has_one :collection
    has_many :user_games 
    has_many :games, through: :user_games
end