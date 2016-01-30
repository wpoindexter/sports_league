class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.date :start
      t.date :end
      t.string :name

      t.timestamps null: false
    end
  end
end
