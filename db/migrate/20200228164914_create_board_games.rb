class CreateBoardGames < ActiveRecord::Migration
  def change
    create_table :board_games do |t|
      t.string :name 
      t.string :player_count
      t.string :playing_time
      t.string :complexity
      t.string :publisher
    end
  end
end
