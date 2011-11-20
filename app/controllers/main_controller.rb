class MainController < ApplicationController

  def index
    show = Show.up_next 
    show = show[0]

    if show
      p show
      seconds = (show.start_time - Time.now).round
      hours = seconds / 60 / 60
      p hours
    end

    if hours and hours.abs <= 2
      redirect_to show
    else
      render :layout => 'landing', :action => 'splash'
    end
  end

end
