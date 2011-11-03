require 'opentok'

class ShowsController < ApplicationController
  before_filter :require_login, :only => [:new, :create]
  before_filter :init_opentok, :only => [:show, :create]

  def show
    @show = Show.find(params[:id])

    if session[@show.sessionId] or @show.archiveId
      role = OpenTok::RoleConstants::MODERATOR
      @moderator = true
    else
      role = OpenTok::RoleConstants::PUBLISHER
      @moderator = false
    end

    @token = @opentok.generate_token :session_id => @show.session_id, :role => role
  end

  def new
    @show = Show.new
  end

  def create
    @show = Show.new(params[:show])
    @show.session_id = @opentok.create_session.to_s
    @show.user_id = @_current_user.id

    if @show.save
      redirect_to @show
    else
      render :action => "new"
    end
  end

  private
  def init_opentok
    @opentok = OpenTok::OpenTokSDK.new APP_CONFIG['opentok_api_key'], APP_CONFIG['opentok_api_secret']
  end
end
