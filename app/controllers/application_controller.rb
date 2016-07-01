class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:username, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:sign_in) do |u|
      u.permit(:login, :username, :email, :password, :remember_me)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:username, :email, :password, :password_confirmation, :current_password)
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    gflash :success => "Signed out successfully!"
    root_path
  end

  def after_sign_in_path_for(resource_or_scope)
    gflash :success => "Signed in successfully!"
    root_path
  end

  def authenticate_admin
    unless current_user.try(:admin?)
      redirect_to root_path
    end
  end

end
