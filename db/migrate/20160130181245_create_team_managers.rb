class CreateTeamManagers < ActiveRecord::Migration
  def change
    create_table :team_managers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
    add_reference :team_managers, :team, index: true
    add_reference :team_managers, :parent, index: true
  end
end
