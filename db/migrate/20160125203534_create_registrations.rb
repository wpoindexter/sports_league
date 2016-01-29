class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :status
      t.boolean :paid

      t.timestamps null: false
    end
    add_reference :registrations, :player, index: true
    add_reference :registrations, :sport, index: true
  end
end
