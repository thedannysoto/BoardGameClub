class AddImgColumnToGames < ActiveRecord::Migration
  def change
    add_column :games, :year_published, :string
    add_column :games, :img_url, :string
  end
end
