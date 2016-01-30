class AddShortNameToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :short_name, :string
  end
end
