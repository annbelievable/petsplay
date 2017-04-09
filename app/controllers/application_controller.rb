class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :phone_number, :address, :postcode, :city, :state, :email, :password, :password_confirmation, :current_password, :photo, :photo_cache, :remove_photo) }
  end

  def after_sign_in_path_for(resource)
    profile_path(current_user)
  end
end
