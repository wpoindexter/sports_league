require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#show' do
    it 'should redirect if not logged in' do
      get :show
      expect(response).to redirect_to '/users/login'
    end

    context 'logged in' do
      login_user
      it 'should show if logged in' do
        get :show
        expect(response).to be_ok
      end
    end
  end
end
