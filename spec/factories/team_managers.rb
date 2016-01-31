FactoryGirl.define do
  factory :team_manager do
    team

    trait :parent do
      parent
    end

    trait :anonymous do
      irst_name 'Stephanie'
      last_name 'Johnson'
      email 'steph@gmail.com'
      phone '3145559999'
    end

    factory :parent_team_manager, traits: [:parent]
    factory :anonymous_team_manager, traits: [:anonymous]
  end
end
