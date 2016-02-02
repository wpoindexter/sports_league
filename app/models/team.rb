class Team < ActiveRecord::Base
  belongs_to :season
  has_many :team_coaches
  has_many :coaches, through: :team_coaches
  has_many :roster_spots
  has_many :players, through: :roster_spots
  has_many :team_managers

  delegate :sport, to: :season

  def roster
    roster_spots
  end

  def head_coach
    team_head_coach = team_coaches.find_by head_coach: true
    team_head_coach.nil? ? nil : team_head_coach.coach
  end

  def depth_chart
    # { player: Player, position: Position, rank: 3 }
    players_on_depth_chart = []
    roster_spots.each do |roster_spot|
      roster_position = roster_spot.roster_position
      players_on_depth_chart << { player: roster_spot.player, position: roster_position.position, rank: roster_position.rank }
    end
    players_on_depth_chart
  end

  def assign_coach(coach)
    coaches << coach
    save
  end
end
