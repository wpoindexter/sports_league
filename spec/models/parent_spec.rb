RSpec.describe Parent, type: :model do
  it 'should have associations' do
    expect(subject).to have_one :address
    expect(subject).to have_one :user_role
    expect(subject).to have_and_belong_to_many :players
  end

  it 'should have delegates' do
    expect(subject).to delegate_method(:user).to :user_role
  end
end
