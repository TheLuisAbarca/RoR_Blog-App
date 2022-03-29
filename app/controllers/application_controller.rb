class ApplicationController < ActionController::Base
  def current_user
    User.first
    # This could serve when we implement authentication
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
