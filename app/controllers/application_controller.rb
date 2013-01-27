class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login

  private
  def require_login
    redirect_to new_sessions_path unless session[:user_id] || controller_name == "sessions"
  end
end
