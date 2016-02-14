RSpec.describe Users::SessionsController, type: :controller do
  before :each do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  context '#new' do
    it 'should use minimal layout' do
      get :new
      expect(response).to render_with_layout 'minimal'
    end
  end
end
