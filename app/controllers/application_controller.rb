class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def authenticate
    
    if not current_user
      p request
    end
  end
end
