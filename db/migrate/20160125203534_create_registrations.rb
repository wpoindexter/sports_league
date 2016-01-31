class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.boolean :active
      t.boolean :paid

      t.timestamps null: false
    end
    add_reference :registrations, :player, index: true
  end
end
