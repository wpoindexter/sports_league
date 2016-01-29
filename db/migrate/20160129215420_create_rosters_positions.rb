class CreateRostersPositions < ActiveRecord::Migration
  def change
    create_table :rosters_positions do |t|
    end
    add_reference :rosters_positions, :roster, index: true
    add_reference :rosters_positions, :position, index: true
  end
end
