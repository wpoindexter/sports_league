class Coach < ActiveRecord::Base
  has_one :address
  has_one :user_role
  has_many :team_coaches
  has_many :teams, through: :team_coaches

  delegate :user, to: :user_role

  def seasons
    teams.map(&:season).uniq
  end

  def sports
    seasons.map(&:sport).uniq
  end

end
