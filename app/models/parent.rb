class Parent < ActiveRecord::Base
  has_one :address
  has_and_belongs_to_many :players
end
