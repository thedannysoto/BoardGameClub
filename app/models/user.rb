class User < ActiveRecord::Base 
    has_secure_password
    has_one :wishlist
    has_many :user_games 
    has_many :games, through: :user_games
end