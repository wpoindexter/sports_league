class Parent < ActiveRecord::Base
  has_one :address
  has_one :user_role
  has_and_belongs_to_many :players

  delegate :user, to: :user_role
end
