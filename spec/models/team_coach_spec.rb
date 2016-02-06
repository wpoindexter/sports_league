require 'rails_helper'

RSpec.describe TeamCoach, type: :model do
  it 'should have associations' do
    expect(subject).to belong_to :coach
    expect(subject).to belong_to :team
  end
end
