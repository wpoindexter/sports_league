require 'rails_helper'

RSpec.describe RosterSpot, type: :model do
  it 'should have associations' do
    expect(subject).to belong_to :player
    expect(subject).to belong_to :team
    expect(subject).to have_one :roster_position
  end

  it 'should have delegates' do
    expect(subject).to delegate_method(:position).to :roster_position
  end
end
