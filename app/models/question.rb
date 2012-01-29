class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :show

  validates :body, :show_id, :user_id, :presence => true

  attr_accessible :body, :user_id, :show_id
end
