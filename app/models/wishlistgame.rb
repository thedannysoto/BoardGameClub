class WishlistGame < ActiveRecord::Base
     belongs_to :wishlist 
     belongs_to :game
end