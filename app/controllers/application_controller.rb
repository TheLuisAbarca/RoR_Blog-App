class ApplicationController < ActionController::Base
  def current_user
    #User.first
    # This could serve when we implement authentication
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # protect_from_forgery prepend: true
    # before_action :configure_permitted_parameters, if: :devise_controller?
    # before_action :authenticate_user!
  
    # protected
  
    # def configure_permitted_parameters
    #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # end
    protect_from_forgery with: :exception

    before_action :update_allowed_parameters, if: :devise_controller?

    protected

    def update_allowed_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(name:, bio:, photo:, email:, password:) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(name:, bio:, photo:, email:, password:, current_password:) }

    end
  end
end
