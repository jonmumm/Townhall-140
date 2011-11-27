class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_admin_user!
    unless current_user and current_user.admin?
      redirect_to new_user_session_path
    end
  end

end
