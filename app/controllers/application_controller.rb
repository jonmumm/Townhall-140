class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_admin_user!
    unless current_user and current_user.admin?
      redirect_to new_user_session_path
    end
  end

  after_filter :store_return_path

  def store_return_path
    if request.get? and request.format.html? and !request.xhr? and !devise_controller?
      session["return_path"] = request.fullpath
    end
  end

=begin
  def after_sign_in_path_for(resource)
    if session["return_path"]
      session["return_path"]
    else
      root
    end
  end
=end
end
