class CreateWishlistGamesJoinTable < ActiveRecord::Migration
  def change
    create_table :wishlist_games do |t|
      t.integer :wishlist_id
      t.integer :game_id
    end
  end
end
