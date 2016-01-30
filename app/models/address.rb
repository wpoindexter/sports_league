class Address < ActiveRecord::Base
  belongs_to :coach
  belongs_to :parent
  belongs_to :player
end
