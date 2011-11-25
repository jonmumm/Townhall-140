class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.new(params[:subscriber])
    @subscriber.save

    respond_to do |format|
      format.js { render :layout => false }
    end
  end

end
