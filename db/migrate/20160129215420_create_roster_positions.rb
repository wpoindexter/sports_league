class CreateRosterPositions < ActiveRecord::Migration
  def change
    create_table :roster_positions do |t|
      t.integer :rank
    end
    add_reference :roster_positions, :roster_spot, index: true
    add_reference :roster_positions, :position, index: true
  end
end
