class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.date :start_time
      t.date :end_time
      t.string :name

      t.timestamps null: false
    end
  end
end
