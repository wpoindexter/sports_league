class Coach < ActiveRecord::Base
  has_one :address
  has_many :team_coaches
  has_many :teams, through: :team_coaches

  def seasons
    teams.map(&:season).uniq
  end

  def sports
    seasons.map(&:sport).uniq
  end
end
