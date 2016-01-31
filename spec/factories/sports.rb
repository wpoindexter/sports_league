FactoryGirl.define do
  factory :sport do
    trait :football do
      name 'Football'
    end

    trait :basketball do
      name 'Basketball'
    end

    factory :football, traits: [:football]
    factory :basketball, traits: [:basketball]
  end
end
