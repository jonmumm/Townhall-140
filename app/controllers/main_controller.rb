class MainController < ApplicationController

  def index
    redirect_to "/shows/11"
  end

  def splash
    render :layout => 'landing'
  end

end
