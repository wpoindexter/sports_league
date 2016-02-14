RSpec.describe RosterSpot, type: :model do
  it 'should have associations' do
    expect(subject).to belong_to :player
    expect(subject).to belong_to :team
    expect(subject).to have_one :roster_position
  end

  it 'should have delegates' do
    expect(subject).to delegate_method(:position).to :roster_position
  end

  it 'should be a starter for the position' do
    roster_position = create :starter
    roster_spot = create :roster_spot, roster_position: roster_position
    expect(roster_spot.starter?).to be true
  end

  it 'should not be a starter for the position' do
    roster_position = create :non_starter
    roster_spot = create :roster_spot, roster_position: roster_position
    expect(roster_spot.starter?).to be false
  end
end
