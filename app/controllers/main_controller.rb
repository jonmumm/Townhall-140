class MainController < ApplicationController

  def index
    @subscriber = Subscriber.new

    @next = Show.next.first
  end

end
