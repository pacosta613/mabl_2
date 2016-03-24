class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :league_id

      t.timestamp null: false
    end
  end
end