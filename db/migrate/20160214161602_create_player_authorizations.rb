class CreatePlayerAuthorizations < ActiveRecord::Migration
  def change
    create_table :player_authorizations do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :confirmed

      t.timestamps null: false
    end
    add_reference :player_authorizations, :parent, index: true
  end
end
