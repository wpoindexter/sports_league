class AddSportToSeason < ActiveRecord::Migration
  def change
    add_reference :seasons, :sport, index: true
  end
end
