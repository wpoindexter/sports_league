class CreateJoinTableParentPlayer < ActiveRecord::Migration
  def change
    create_join_table :parents, :players do |t|
      # t.index [:parent_id, :player_id]
      # t.index [:player_id, :parent_id]
    end
  end
end
