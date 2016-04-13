class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :show_errors, if: :devise_controller?

  protected

  # :nocov:
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit :email, :password, :password_confirmation, user_roles_attributes: [parent_attributes: [:first_name, :last_name, :phone], player_attributes: [:parent_email, :first_name, :last_name, :phone]]
    end
  end

  # :nocov:
  def show_errors
    flash[:error] = resource.errors.full_messages.to_sentence if resource
  end
end
