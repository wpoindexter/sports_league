class RosterSpot < ActiveRecord::Base
  belongs_to :player
  belongs_to :team
  has_one :roster_position

  delegate :position, to: :roster_position

  def starter?
    roster_position.rank.eql? 1
  end
end
