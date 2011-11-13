class EventController < ApplicationController
  def create
    @show = Show.find(params[:show_id])

    if session[:user_id] == @show.admin_name
      @event = Event.create(:show_id => params[:show_id], :stream_id => params[:stream_id], :state => params[:state])
      response = { :success => true, :event => @event }
    else
      response = { :success => false, :msg => "Do not have access" }
    end

    render :json => response
  end

  def index
    @events = Event.where(:show_id => params[:show_id])

    render :json => @events
  end

  def current
    @current = Event.where(:show_id => params[:show_id]).group("state").where("state = 'guest' OR state = 'host'")

    render :json => @current
  end

end
