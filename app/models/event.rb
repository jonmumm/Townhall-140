require 'pusher'

Pusher.app_id = APP_CONFIG['pusher_app_id']
Pusher.key = APP_CONFIG['pusher_key']  
Pusher.secret = APP_CONFIG['pusher_secret']

class Event < ActiveRecord::Base
  belongs_to :show
  validates :show_id, :stream_id, :state, :presence => true

  before_create :remove_last_guest
  after_create :push_update

  private
  def remove_last_guest
    if self.state == "guest"
      event = Event.where(:show_id => show_id, :state => "guest").order("created_at DESC").first

      if event
        Event.create(:show_id => event.show_id, :stream_id => event.stream_id, :state => "leave")
      end
    end
  end

  def push_update
    Pusher[show_id].trigger!('state', { :stream_id => stream_id, :state => state })
  end

end
