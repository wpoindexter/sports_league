require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'should have associations' do
    expect(subject).to belong_to :coach
    expect(subject).to belong_to :parent
    expect(subject).to belong_to :player
  end
end
