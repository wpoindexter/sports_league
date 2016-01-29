class Coach < ActiveRecord::Base
  has_one :address
  has_many :teams
end
