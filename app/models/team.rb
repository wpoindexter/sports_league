class Team < ActiveRecord::Base
  belongs_to :sport
  belongs_to :season
  has_many :team_coaches
  has_many :coaches, through: :team_coaches
  has_many :roster_spots
  has_many :players, through: :roster_spots

  def roster
    roster_spots
  end
end
