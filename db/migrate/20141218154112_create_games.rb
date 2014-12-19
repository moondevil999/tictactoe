class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :p1_id
      t.integer :p2_id
      t.integer :starting_player_id
      t.integer :winner_id
      t.boolean :ended, null: false, default: false
    end
  end
end
