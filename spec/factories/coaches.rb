FactoryGirl.define do
  factory :coach do
    first_name 'First'
    sequence :last_name do |n|
      "Last#{n}"
    end
    status 'COACHING'
    email 'perri.johnson@gmail'
    phone '3145556666'
  end
end
