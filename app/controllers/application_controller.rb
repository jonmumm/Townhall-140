class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def current_user
    @_current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
  end

  def require_login
    unless logged_in?
      redirect_to root_url, :notice => "Must be signed in."
    end
  end

  def logged_in?
    !!current_user
  end
end
