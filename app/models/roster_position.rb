class RosterPosition < ActiveRecord::Base
  belongs_to :roster_spot
  belongs_to :position
end
