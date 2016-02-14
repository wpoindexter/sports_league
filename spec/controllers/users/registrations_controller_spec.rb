RSpec.describe Users::RegistrationsController, type: :controller do
  before :each do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  context '#parent' do
    it 'should use minimal layout' do
      get :parent
      expect(response).to render_with_layout 'minimal'
    end

    it 'should setup a new registration' do
      get :parent
      expect(assigns[:devise_parameter_sanitizer].resource_name).to eq :user
    end
  end

  context '#player' do
    it 'should use minimal layout' do
      get :player
      expect(response).to render_with_layout 'minimal'
    end

    it 'should setup a new registration' do
      get :player
      expect(assigns[:devise_parameter_sanitizer].resource_name).to eq :user
    end
  end

  context '#coach' do
    it 'should use minimal layout' do
      get :coach
      expect(response).to render_with_layout 'minimal'
    end

    it 'should setup a new registration' do
      get :coach
      expect(assigns[:devise_parameter_sanitizer].resource_name).to eq :user
    end
  end
end
