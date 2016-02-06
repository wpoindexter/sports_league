FactoryGirl.define do
  factory :user_role do
    user

    trait :coach_user do
      coach
    end

    trait :parent_user do
      association :parent, factory: :father
    end

    trait :player_user do
      player
    end

    trait :admin do
      admin true
    end

    factory :coach_user_role, traits: [:coach_user]
    factory :parent_user_role, traits: [:parent_user]
    factory :player_user_role, traits: [:player_user]
    factory :admin_user_role, traits: [:admin]
  end
end
