RSpec.describe RosterPosition, type: :model do
  it 'should have associations' do
    expect(subject).to belong_to :position
    expect(subject).to belong_to :roster_spot
  end
end
