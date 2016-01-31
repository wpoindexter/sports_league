FactoryGirl.define do
  factory :season do
    start_date Time.zone.today
    end_date Time.zone.today + 3.months
    name 'Season 1'

    trait :football do
      association :sport, factory: :football
    end

    factory :football_season, traits: [:football]
  end
end
