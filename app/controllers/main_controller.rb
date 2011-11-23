class MainController < ApplicationController

  def index
    render :layout => 'landing', :action => 'splash'
  end

end
