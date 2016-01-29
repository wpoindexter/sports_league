class Roster < ActiveRecord::Base
  belongs_to :player
  belongs_to :team

  def player_positions
    RosterPosition.where(player: player).map &:position
  end
end
