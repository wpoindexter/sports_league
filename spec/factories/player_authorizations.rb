FactoryGirl.define do
  factory :player_authorization do
    first_name 'First'
    last_name 'Last'
    parent
    confirmed false
  end
end
