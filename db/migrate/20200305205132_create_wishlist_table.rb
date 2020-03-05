class CreateWishlistTable < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.integer :user_id 
    end
  end
end
