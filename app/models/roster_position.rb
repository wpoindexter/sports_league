class RosterPosition < ActiveRecord::Base
  belongs_to :roster
  belongs_to :position
end
