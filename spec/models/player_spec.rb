require 'rails_helper'

RSpec.describe Player, type: :model do
  it 'should have associations' do
    expect(subject).to have_one :address
    expect(subject).to have_one :user_role
    expect(subject).to have_and_belong_to_many :parents
    expect(subject).to have_many :registrations
    expect(subject).to have_many :seasons
    expect(subject).to have_many :roster_spots
    expect(subject).to have_many :teams
  end

  it 'should have delegates' do
    expect(subject).to delegate_method(:user).to :user_role
  end

  it 'should have unique sports via registrations' do
    player = create :player
    football_season = create :football_season
    basketball_season = create :basketball_season
    football = football_season.sport
    basketball = basketball_season.sport
    soccer = create :sport, name: 'Soccer' # should not show up as the player did not register
    create :active_paid_registration, season: football_season, player: player
    create :active_paid_registration, season: basketball_season, player: player
    expect(player.sports.size).to eq 2
    expect(player.sports).to include football
    expect(player.sports).to include basketball
    expect(player.sports).to_not include soccer
  end
end
