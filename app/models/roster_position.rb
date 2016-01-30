class RosterPosition < ActiveRecord::Base
  belongs_to :position
  belongs_to :roster_spot
end
