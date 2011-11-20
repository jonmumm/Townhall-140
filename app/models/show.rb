class Show < ActiveRecord::Base
  has_many :events

  validates :hashtag, :session_id, :admin_name, :admin_password, :start_time, :presence => true

  scope :up_next, lambda { where("start_time > ?", Time.now ).order("start_time ASC").limit(1) }
end
