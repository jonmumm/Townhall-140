class Show < ActiveRecord::Base
  has_many :events

  validates :hashtag, :session_id, :admin_name, :admin_password, :presence => true
end
