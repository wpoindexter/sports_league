class Player < ActiveRecord::Base
  attr_accessor :parent_email

  has_one :address
  has_one :user_role
  has_one :user, through: :user_role
  has_and_belongs_to_many :parents
  has_many :registrations
  has_many :seasons, through: :registrations
  has_many :roster_spots
  has_many :teams, through: :roster_spots

  validate :check_authorization, on: :create

  def sports
    registrations.map(&:sport).uniq
  end

  private

  def check_authorization
    user = User.find_by email: parent_email
    parent = nil
    player_authorization = nil
    if user
      user.user_roles.each do |user_role|
        parent = user_role.parent if user_role.parent
        player_authorization = ParentAuthorization.find_by(parent: parent, first_name: first_name, last_name: last_name) if parent
      end
    end
    if parent && player_authorization
      player_authorization.update_attribute :confirmed, true
    else
      errors.add :parents, 'your parent must authorize you before sign up'
    end
  end
end
