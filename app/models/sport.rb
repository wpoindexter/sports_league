class Sport < ActiveRecord::Base
  has_many :seasons

  def head_coaches
    teams.map(&:head_coach).uniq
  end

  def coaches
    teams.map(&:coaches).flatten.uniq
  end

  def players
    seasons.map(&:players).flatten.uniq
  end

  def teams
    seasons.map(&:teams).flatten.uniq
  end
end
