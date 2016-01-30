class UserRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :coach
  belongs_to :parent
  belongs_to :player

  COACH = 'COACH'.freeze
  PLAYER = 'PLAYER'.freeze
  PARENT = 'PARENT'.freeze

  def role
    { role_name: COACH, role: coach } unless coach.nil?
    { role_name: PLAYER, role: player } unless player.nil?
    { role_name: PARENT, role: parent } unless parent.nil?
  end
end
