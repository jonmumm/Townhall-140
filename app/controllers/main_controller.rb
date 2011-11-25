class MainController < ApplicationController

  def index
    @subscriber = Subscriber.new

    next_shows = Show.up_next
    @next = next_shows[0]
  end

end
