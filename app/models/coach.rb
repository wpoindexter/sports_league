class Coach < ActiveRecord::Base
  has_one :address
  has_many :team_coaches
  has_many :teams, through: :team_coaches
end
