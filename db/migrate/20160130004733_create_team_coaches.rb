class CreateTeamCoaches < ActiveRecord::Migration
  def change
    create_table :team_coaches do |t|
      t.boolean :head_coach
      t.string :role

      t.timestamps null: false
    end
    add_reference :team_coaches, :team, index: true
    add_reference :team_coaches, :coach, index: true
  end
end
