class EventsController < ApplicationController
  # before_filter :authenticate, :only => [:create]

  def create
    @show = Show.find(params[:show_id])
    
    if @show.user_is_moderator(current_user)
      @event = Event.new(params[:event])
      @event.show_id = @show.id
      if @event.save
        render :json => @event, :status => :created
      else
        render :json => @event.errors, :status => :unprocessable_entity
      end
    else
      render :json => { :message => "User does not have access to create events for this show" }, :status => :unauthorized
    end
  end

  def index
    @events = Event.where(:show_id => params[:show_id])

    render :json => @events
  end

=begin
  def current
    guest = Event.where(:show_id => params[:show_id], :state => "guest").order("created_at DESC").limit(1)
    host = Event.where(:show_id => params[:show_id], :state => "host").order("created_at DESC").limit(1)

    response = [ ]
    if guest[0]
      response << guest[0]
    end
    if host[0]
      response << host[0]
    end

    render :json => response
  end
=end

end
