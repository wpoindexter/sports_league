module Users
  class RegistrationsController < Devise::RegistrationsController
    layout 'minimal'

    def parent
      new
    end

    def player
      new
    end

    def coach
      new
    end

    # :nocov:
    def create
      create_resource
    end

    private

    # :nocov:
    def create_resource
      build_resource(sign_up_params)
      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        session[:error_resource] = resource
        resource_create_failure
      end
    end

    # :nocov:
    def resource_create_failure
      redirect_to request.referrer
    end
  end
end
