class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    p request.referer
    p :back
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid omniauth['provider'], omniauth['uid']
    if authentication
      p authentication.user
      sign_in_and_redirect :user, authentication.user
    elsif current_user
      current_user.authentication.create :provider => omniauth['provider'], :uid => omniauth['uid']
      redirect_to authentications_url
    else
      user = User.new
      user.authentications.build :provider => omniauth['provider'], :uid =>omniauth['uid']
      user.save(:validate => false)
      sign_in_and_redirect :user, user
    end
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end
end
