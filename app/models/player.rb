class Player < ActiveRecord::Base
  has_one :address
  has_and_belongs_to_many :parents
  has_many :registrations
  has_many :sports, through: :registrations
  has_many :teams, through: :rosters
end
