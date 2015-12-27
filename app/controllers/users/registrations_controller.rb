class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params, only: [:create]

  protected
    def configure_sign_up_params
      devise_parameter_sanitizer.for(:sign_up) << :username
    end
end
