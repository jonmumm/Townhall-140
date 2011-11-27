class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid omniauth['provider'], omniauth['uid']

    if authentication
      sign_in_and_redirect :user, authentication.user

    elsif current_user
      current_user.authentication.create :provider => omniauth['provider'], :uid => omniauth['uid']
      redirect_to authentications_url

    else
      user = User.new
      user.apply_omniauth(omniauth)
      
      if user.save
        sign_in_and_redirect :user, user
      else
        session[:omniauth] = omniauth.except 'extra'
        redirect_to new_user_registration_url
      end

    end
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end
end
