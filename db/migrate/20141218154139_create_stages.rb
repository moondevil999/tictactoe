class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.belongs_to :game
      t.string :position
      t.string :xo
      t.timestamps
    end
  end
end
