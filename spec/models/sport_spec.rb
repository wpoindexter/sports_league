RSpec.describe Sport, type: :model do
  it 'should have associations' do
    expect(subject).to have_many :seasons
  end

  it 'should get head coaches for a sport' do
    season = create :football_season
    sport = season.sport
    teams = create_pair :team, season: season
    hc1 = create :head_coach, team: teams.first
    ac1 = create :assistant_coach, team: teams.first
    hc2 = create :head_coach, team: teams.last
    ac2 = create :assistant_coach, team: teams.last
    expect(sport.head_coaches.size).to eq 2
    expect(sport.head_coaches).to include hc1.coach
    expect(sport.head_coaches).to include hc2.coach
    expect(sport.head_coaches).to_not include ac1.coach
    expect(sport.head_coaches).to_not include ac2.coach
  end

  it 'should get head coaches for a sport' do
    season = create :football_season
    sport = season.sport
    teams = create_pair :team, season: season
    hc1 = create :head_coach, team: teams.first
    ac1 = create :assistant_coach, team: teams.first
    hc2 = create :head_coach, team: teams.last
    ac2 = create :assistant_coach, team: teams.last
    expect(sport.coaches.size).to eq 4
    expect(sport.coaches).to include hc1.coach
    expect(sport.coaches).to include hc2.coach
    expect(sport.coaches).to include ac1.coach
    expect(sport.coaches).to include ac2.coach
  end

  it 'should get teams for a sport' do
    season = create :football_season
    sport = season.sport
    teams = create_pair :team, season: season
    expect(sport.teams.size).to eq 2
    expect(sport.teams).to include teams.first
    expect(sport.teams).to include teams.last
  end

  it 'should get players for a sport' do
    season = create :football_season
    sport = season.sport
    player1 = create(:registration, season: season).player
    player2 = create(:registration, season: season).player
    expect(sport.players.size).to eq 2
    expect(sport.players).to include player1
    expect(sport.players).to include player2
  end
end
