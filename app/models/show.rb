require 'opentok'

class Show < ActiveRecord::Base
  has_many :events

  before_create :generate_session_id

  validates :hashtag, :admin_name, :admin_password, :start_time, :presence => true

  scope :next, lambda { where("start_time > ?", Time.now.advance(:hours => -2)).order("start_time ASC") }

  private
  def generate_session_id
    opentok = OpenTok::OpenTokSDK.new APP_CONFIG['opentok_api_key'], APP_CONFIG['opentok_api_secret'], :api_url => "https://api.opentok.com/hl"
    self.session_id = opentok.create_session.to_s
  end
end
