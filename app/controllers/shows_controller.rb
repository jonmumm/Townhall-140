require 'opentok'

class ShowsController < ApplicationController
  before_filter :require_login, :only => [:new, :create]
  before_filter :init_opentok, :only => [:new, :create]

  def show
    @show = Show.find(params[:id])
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
