class Player < ActiveRecord::Base
  has_one :address
  has_one :user_role
  has_and_belongs_to_many :parents
  has_many :registrations
  has_many :seasons, through: :registrations
  has_many :roster_spots
  has_many :teams, through: :roster_spots

  delegate :user, to: :user_role

  def sports
    registrations.map(&:sport).uniq
  end
end
