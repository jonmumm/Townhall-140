class Show < ActiveRecord::Base
  belongs_to :user

  validates :title, :session_id, :user_id, :presence => true
end
