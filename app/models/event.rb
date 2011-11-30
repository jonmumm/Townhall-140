require 'pusher'

Pusher.app_id = APP_CONFIG['pusher_app_id']
Pusher.key = APP_CONFIG['pusher_key']  
Pusher.secret = APP_CONFIG['pusher_secret']

class Event < ActiveRecord::Base
  belongs_to :show
  belongs_to :user
  validates :show_id, :user_id, :state, :presence => true
  validates :state, :inclusion => { :in => %w(guest host queue) , :message => "%{value} is not a valid state" }

  before_create :remove_last_guest
  after_create :push_update

  private
  def remove_last_guest
    if self.state == "guest"
      event = Event.where(:show_id => show_id, :state => "guest").order("created_at DESC").first

      if event
        Event.create(:show_id => event.show_id, :user_id => event.user_id, :state => "queue")
      end
    end
  end

  def push_update
    Pusher[show_id].trigger!('state', { :user_id => user_id, :state => state })
  end

end
