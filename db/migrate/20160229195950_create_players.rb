class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name 
      t.integer :team_id
      t.integer :league_id
      t.integer :jersey_number
      t.string :position

      t.timestamp null: false
    end
  end
end