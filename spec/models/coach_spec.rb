require 'rails_helper'

RSpec.describe Coach, type: :model do
  it 'should have associations' do
    expect(subject).to have_one :address
    expect(subject).to have_one :user_role
    expect(subject).to have_many :team_coaches
    expect(subject).to have_many :teams
  end

  it 'should have delegates' do
    expect(subject).to delegate_method(:user).to(:user_role)
  end

  it 'should return unique seasons where this coach has coached' do
    coach = create :coach
    fall_2014 = create :football_season, start_date: Chronic.parse('August 1, 2014')
    team_2014 = create :team, season: fall_2014 # no coach
    fall_2015 = create :football_season, start_date: Chronic.parse('August 1, 2015')
    team_2015 = create :team, season: fall_2015
    team_2015.assign_coach coach
    fall_2016 = create :football_season, start_date: Chronic.parse('August 1, 2016')
    team_2016_1 = create :team, season: fall_2016
    team_2016_2 = create :team, season: fall_2016
    # coaching 2 teams in 2016 should not return the fall 2016 season twice
    team_2016_1.assign_coach coach
    team_2016_2.assign_coach coach
    expect(coach.seasons).to_not include fall_2014
    expect(coach.seasons.size).to eq 2
    expect(coach.seasons).to include fall_2015
    expect(coach.seasons).to include fall_2016
  end

  it 'should return unique sports that this coach has coached' do
    coach = create :coach
    fball = Sport.create name: 'fball'
    bball = Sport.create name: 'bball'
    fall_2014 = create :season, sport: fball, start_date: Chronic.parse('August 1, 2014')
    team_2014 = create :team, season: fall_2014
    team_2014.assign_coach coach
    winter_2015 = create :season, sport: bball, start_date: Chronic.parse('August 1, 2014')
    team_2015_bball = create :team, season: winter_2015
    team_2015_bball.assign_coach coach
    fall_2015 = create :season, sport: fball, start_date: Chronic.parse('August 1, 2015')
    team_2015_fball = create :team, season: fall_2015
    team_2015_fball.assign_coach coach
    # coaching the same sport twice should not return that sport twice
    expect(coach.sports.size).to eq 2
    expect(coach.sports).to include fball
    expect(coach.sports).to include bball
  end
end
