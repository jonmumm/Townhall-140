class MainController < ApplicationController

  def index
    if logged_in?
      redirect_to :new_show
    else
      render
    end
  end

  def splash
    render :layout => 'landing'
  end

end
