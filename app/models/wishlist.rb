class Wishlist < ActiveRecord::Base 
    belongs_to :user
    has_many :wishlist_games 
    has_many :games, through: :wishlist_games
end