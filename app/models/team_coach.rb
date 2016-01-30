class TeamCoach < ActiveRecord::Base
  belongs_to :coach
  belongs_to :team
end
