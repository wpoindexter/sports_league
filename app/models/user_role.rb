# frozen_string_literal: true
class UserRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :coach
  belongs_to :parent
  belongs_to :player

  COACH = 'COACH'.freeze
  PLAYER = 'PLAYER'.freeze
  PARENT = 'PARENT'.freeze

  def role
    return { role_name: COACH, role: coach } unless coach.nil?
    return { role_name: PLAYER, role: player } unless player.nil?
    return { role_name: PARENT, role: parent } unless parent.nil?
  end
end
