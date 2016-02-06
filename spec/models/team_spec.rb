require 'rails_helper'

RSpec.describe Team, type: :model do
  it 'should have associations' do
    expect(subject).to belong_to :season
    expect(subject).to have_many :team_coaches
    expect(subject).to have_many :coaches
    expect(subject).to have_many :roster_spots
    expect(subject).to have_many :players
    expect(subject).to have_many :team_managers
  end

  it 'should have delegates' do
    expect(subject).to delegate_method(:sport).to :season
  end

  it 'should have roster_spots known as a roster' do
    team = create :team
    roster_spot_1 = create :roster_spot, team: team
    roster_spot_2 = create :roster_spot, team: team
    expect(team.roster.size).to eq 2
    expect(team.roster).to include roster_spot_1
    expect(team.roster).to include roster_spot_2
  end

  it 'should have a head coach' do
    team = create :team
    coach = create :head_coach, team: team
    expect(team.head_coach).to eq coach.coach
  end

  it 'should not have a head coach' do
    team = create :team
    create :assistant_coach, team: team
    create :assistant_coach, team: team
    expect(team.head_coach).to be nil
  end

  it 'should have a depth chart' do
    team = create :team
    player1 = create :player
    quaterback = create :position, name: 'Quaterback', short_name: 'QB'
    team.assign_player player1, quaterback, 1
    player2 = create :player
    running_back = create :position, name: 'Running Back', short_name: 'RB'
    team.assign_player player2, running_back
    player3 = create :player
    team.assign_player player3 # no position
    depth_chart = team.depth_chart
    expect(depth_chart.size).to eq 3
    expect(depth_chart[0][:player]).to eq player1
    expect(depth_chart[0][:position]).to eq quaterback
    expect(depth_chart[0][:rank]).to eq 1
    expect(depth_chart[1][:player]).to eq player2
    expect(depth_chart[1][:position]).to eq running_back
    expect(depth_chart[1][:rank]).to be nil
    expect(depth_chart[2][:player]).to eq player3
    expect(depth_chart[2][:position]).to be nil
    expect(depth_chart[2][:rank]).to be nil
  end
end
