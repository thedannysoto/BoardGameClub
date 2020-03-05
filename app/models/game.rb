class Game < ActiveRecord::Base 
    has_many :user_games
    has_many :users, through: :user_games
    has_many :wishlist_games 
    has_many :wishlists, through: :wishlist_games
end