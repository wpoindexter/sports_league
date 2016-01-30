class Registration < ActiveRecord::Base
  belongs_to :player
  belongs_to :season

  delegate :sport, to: :season
end
