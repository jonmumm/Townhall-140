require 'opentok'

class ShowsController < ApplicationController
  before_filter :authenticate, :only => [:admin]
  before_filter :init_opentok, :only => [:show, :create, :admin]

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

  def new
    @show = Show.new
  end

  def create
    @show = Show.new(params[:show])
    @show.session_id = @opentok.create_session.to_s

    if @show.save
      redirect_to "/shows/#{@show.id}/admin"
    else
      render :action => "new"
    end
  end

  private
  def init_opentok
    @opentok = OpenTok::OpenTokSDK.new APP_CONFIG['opentok_api_key'], APP_CONFIG['opentok_api_secret']
  end

  def generate_token(role)
    @opentok.generate_token :session_id => @show.session_id, :role => role
  end

  def authenticate
    @show = Show.find(params[:id])

    authenticate_or_request_with_http_basic do |username, password|
      username == @show.admin_name && password == @show.admin_password
    end

    session[:user_id] = @show.admin_name
  end
end
