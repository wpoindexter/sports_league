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
end
