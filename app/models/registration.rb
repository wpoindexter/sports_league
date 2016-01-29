class Registration < ActiveRecord::Base
  belongs_to :player
  belongs_to :sport
  belongs_to :season
end
