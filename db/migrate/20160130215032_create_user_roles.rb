class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.boolean :admin

      t.timestamps null: false
    end
    add_reference :user_roles, :user, index: true
    add_reference :user_roles, :coach, index: true
    add_reference :user_roles, :parent, index: true
    add_reference :user_roles, :player, index: true
  end
end
