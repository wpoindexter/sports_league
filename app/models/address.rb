class Address < ActiveRecord::Base
  belongs_to :parent
  belongs_to :player
  belongs_to :coach
end
