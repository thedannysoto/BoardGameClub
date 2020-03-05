class CreateWishlistGamesJoinTable < ActiveRecord::Migration
  def change
    create_table :wishlistgames do |t|
      t.integer :wishlist_id
      t.integer :game_id
    end
  end
end
