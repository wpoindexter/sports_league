FactoryGirl.define do
  factory :roster_position do
    trait :starter do
      rank 1
    end

    trait :non_starter do
      rank 4
    end

    factory :starter, traits: [:starter]
    factory :non_starter, traits: [:non_starter]
  end
end
