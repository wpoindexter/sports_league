RSpec.describe Season, type: :model do
  it 'should have associations' do
    expect(subject).to belong_to :sport
    expect(subject).to have_many :registrations
    expect(subject).to have_many :players
    expect(subject).to have_many :teams
  end

  it 'should get head coaches for a season' do
    season = create :football_season
    teams = create_pair :team, season: season
    hc1 = create :head_coach, team: teams.first
    ac1 = create :assistant_coach, team: teams.first
    hc2 = create :head_coach, team: teams.last
    ac2 = create :assistant_coach, team: teams.last
    expect(season.head_coaches.size).to eq 2
    expect(season.head_coaches).to include hc1.coach
    expect(season.head_coaches).to include hc2.coach
    expect(season.head_coaches).to_not include ac1.coach
    expect(season.head_coaches).to_not include ac2.coach
  end

  it 'should get all coaches for a season' do
    season = create :football_season
    teams = create_pair :team, season: season
    hc1 = create :head_coach, team: teams.first
    ac1 = create :assistant_coach, team: teams.first
    hc2 = create :head_coach, team: teams.last
    ac2 = create :assistant_coach, team: teams.last
    expect(season.coaches.size).to eq 4
    expect(season.coaches).to include hc1.coach
    expect(season.coaches).to include hc2.coach
    expect(season.coaches).to include ac1.coach
    expect(season.coaches).to include ac2.coach
  end
end
