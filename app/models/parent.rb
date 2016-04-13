class Parent < ActiveRecord::Base
  has_one :address
  has_one :user_role
  has_one :user, through: :user_role
  has_and_belongs_to_many :players
  has_many :parent_authorizations
end
