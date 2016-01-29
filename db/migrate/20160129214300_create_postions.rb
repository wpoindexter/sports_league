class CreatePostions < ActiveRecord::Migration
  def change
    create_table :postions do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
