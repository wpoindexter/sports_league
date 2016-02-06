require 'rails_helper'

RSpec.describe UserRole, type: :model do
  it 'should have associations' do
    expect(subject).to belong_to :user
    expect(subject).to belong_to :coach
    expect(subject).to belong_to :parent
    expect(subject).to belong_to :player
  end

  it 'has a coach role' do
    user_role = create :coach_user_role
    expect(user_role.role[:role_name]).to eq UserRole::COACH
  end

  it 'has a player role' do
    user_role = create :player_user_role
    expect(user_role.role[:role_name]).to eq UserRole::PLAYER
  end

  it 'has a parent role' do
    user_role = create :parent_user_role
    expect(user_role.role[:role_name]).to eq UserRole::PARENT
  end

  it 'has no role' do
    expect(create(:user_role).role).to be nil
  end
end
