require 'rails_helper'

RSpec.describe TeamManager, type: :model do
  it 'should have associations' do
    expect(subject).to belong_to :team
  end
end
