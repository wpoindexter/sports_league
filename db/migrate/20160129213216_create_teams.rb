class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :grade1
      t.integer :grade2
      t.string :name

      t.timestamps null: false
    end
    add_reference :teams, :coach, index: true
    add_reference :teams, :sport, index: true
    add_reference :teams, :season, index: true
  end
end
