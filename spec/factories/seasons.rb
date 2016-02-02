FactoryGirl.define do
  factory :season do
    start_date Time.zone.today
    end_date Time.zone.today + 3.months
    name 'Season 1'

    trait :football_sport do
      association :sport, factory: :football
    end

    trait :basketball_sport do
      association :sport, factory: :basketball
    end

    factory :football_season, traits: [:football_sport]
    factory :basketball_season, traits: [:basketball_sport]
  end
end
