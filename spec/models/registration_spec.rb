RSpec.describe Registration, type: :model do
  it 'should have associations' do
    expect(subject).to belong_to :player
    expect(subject).to belong_to :season
  end

  it 'should have delegates' do
    expect(subject).to delegate_method(:sport).to :season
  end
end
