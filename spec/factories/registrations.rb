FactoryGirl.define do
  factory :registration do
    player

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end

    trait :paid do
      paid true
    end

    trait :unpaid do
      paid false
    end

    factory :active_paid_registration, traits: [:active, :paid]
    factory :inactive_paid_registration, traits: [:inactive, :paid]
    factory :active_unpaid_registration, traits: [:active, :unpaid]
    factory :inactive_unpaid_registration, traits: [:inactive, :unpaid]
  end
end
