require 'pusher'

Pusher.app_id = APP_CONFIG['pusher_app_id']
Pusher.key = APP_CONFIG['pusher_key']  
Pusher.secret = APP_CONFIG['pusher_secret']

class Chat < ActiveRecord::Base
  belongs_to :user
  belongs_to :show

  validates :user_id, :show_id, :message, :presence => true

  attr_accessible :user_id, :show_id, :message

  after_create :push_update

  private
  def push_update
    Pusher[show_id].trigger!('chat', { :user_id => user_id, :message => message })
  end
end
