class Team < ActiveRecord::Base
  belongs_to :sport
  belongs_to :coach
  belongs_to :season
  has_many :rosters
  has_many :players, through: :rosters
end
