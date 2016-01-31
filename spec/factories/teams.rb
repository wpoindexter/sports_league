FactoryGirl.define do
  factory :team do
    grade1 3
    grade2 4
    name 'Coach Johnson 3rd & 4th Grade Football'
    association :season, factory: :football_season
  end
end
