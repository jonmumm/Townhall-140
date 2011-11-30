require 'opentok'

class ShowsController < ApplicationController
  before_filter :init_opentok, :only => [:show]

  def show
    @show = Show.find(params[:id])

    if @show.user_is_moderator current_user 
      @role = OpenTok::RoleConstants::MODERATOR
    elsif current_user
      @role = OpenTok::RoleConstants::PUBLISHER
    else
      @role = OpenTok::RoleConstants::SUBSCRIBER
    end

    @token = generate_token @role
  end

  private
  def init_opentok
    @opentok = OpenTok::OpenTokSDK.new APP_CONFIG['opentok_api_key'], APP_CONFIG['opentok_api_secret'], :api_url => "https://api.opentok.com/hl"
  end

  def generate_token(role)
    if current_user
      @opentok.generate_token :session_id => @show.session_id, :role => role, :connection_data => current_user.id.to_s
    else
      @opentok.generate_token :session_id => @show.session_id, :role => role
    end
  end

  
#  def authenticate
#    @show = Show.find(params[:id])
#
#    authenticate_or_request_with_http_basic do |username, password|
#      password == @show.admin_password
#    end
#
#    session[:user_id] = @show.admin_name
#  end
end
