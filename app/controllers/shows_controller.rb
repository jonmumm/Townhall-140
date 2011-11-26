require 'opentok'

class ShowsController < ApplicationController
  before_filter :authenticate, :only => [:admin]
  before_filter :init_opentok, :only => [:show, :admin]

  def show
    @show = Show.find(params[:id])

    @token = generate_token OpenTok::RoleConstants::PUBLISHER
    @moderator = false
  end

  def admin
    @token = generate_token OpenTok::RoleConstants::MODERATOR
    @moderator = true

    render 'show'
  end

  private
  def init_opentok
    @opentok = OpenTok::OpenTokSDK.new APP_CONFIG['opentok_api_key'], APP_CONFIG['opentok_api_secret'], :api_url => "https://api.opentok.com/hl"
  end

  def generate_token(role)
    @opentok.generate_token :session_id => @show.session_id, :role => role
  end

  def authenticate
    @show = Show.find(params[:id])

    authenticate_or_request_with_http_basic do |username, password|
      password == @show.admin_password
    end

    session[:user_id] = @show.admin_name
  end
end
