FactoryGirl.define do
  factory :team_coach do
    team
    coach

    trait :head_coach do
      head_coach true
    end

    trait :assistant_coach do
      head_coach false
      role 'Assistant Coach'
    end

    factory :head_coach, traits: [:head_coach]
    factory :assistant_coach, traits: [:assistant_coach]
  end
end
