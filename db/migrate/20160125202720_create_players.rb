class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.date :birth_date
      t.integer :weight
      t.integer :grade
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
