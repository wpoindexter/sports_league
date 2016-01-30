class Season < ActiveRecord::Base
  belongs_to :sport
  has_many :registrations
  has_many :players, through: :registrations
  has_many :teams

  def head_coaches
    teams.map(&:head_coach)
  end

  def coaches
    teams.map(&:coaches).flatten.uniq
  end
end
