require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have associations' do
    expect(subject).to have_many :user_roles
  end

  it 'should be an admin' do
    expect(create(:admin_user_role).user.admin?).to eq true
  end

  it 'should not be an admin' do
    expect(create(:coach_user_role).user.admin?).to eq false
  end

  it 'should have roles' do
    user = create :user
    coach_role = create :coach_user_role, user: user
    parent_role = create :parent_user_role, user: user
    expect(user.roles.size).to eq 2
    expect(user.roles).to include coach_role.role
    expect(user.roles).to include parent_role.role
  end
end
