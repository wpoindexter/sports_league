class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|

      t.timestamps null: false
    end
    add_reference :rosters, :player, index: true
    add_reference :rosters, :team, index: true
  end
end
