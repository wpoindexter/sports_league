class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :city
      t.string :state
      t.string :postal_code

      t.timestamps null: false
    end
    add_reference :addresses, :parent, index: true
    add_reference :addresses, :player, index: true
    add_reference :addresses, :coach, index: true
  end
end
