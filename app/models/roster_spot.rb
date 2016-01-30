class RosterSpot < ActiveRecord::Base
  belongs_to :player
  belongs_to :team
  has_one :roster_position
end
