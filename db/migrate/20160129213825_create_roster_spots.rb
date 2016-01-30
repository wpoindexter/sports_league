class CreateRosterSpots < ActiveRecord::Migration
  def change
    create_table :roster_spots do |t|

      t.timestamps null: false
    end
    add_reference :roster_spots, :player, index: true
    add_reference :roster_spots, :team, index: true
  end
end
