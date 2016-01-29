class AddSeasonToRegistrations < ActiveRecord::Migration
  def change
    add_reference :registrations, :season, index: true
  end
end
