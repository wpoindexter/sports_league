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
  end
end
