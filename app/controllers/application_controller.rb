class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:first_name, :last_name])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:first_name, :last_name])
  end
  skip_before_action :verify_authenticity_token, raise: false
  
  before_action :authenticate_user!
  
end
