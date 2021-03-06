class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def unauthorized
    redirect_to root_url, alert: 'You are not authorized for this action!'
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def admin_only
    unauthorized unless @current_user and @current_user.admin?
  end
end
