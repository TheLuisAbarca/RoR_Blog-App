class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :photo, :bio, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :email, :password, :current_password)}
  end

  #def current_user
    #User.first
    # This could serve when we implement authentication
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #end
end
