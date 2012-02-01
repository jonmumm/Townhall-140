class Vote < ActiveRecord::Base
  belongs_to :user  # this is optional; may be ip address instead
  belongs_to :question, counter_cache: true

  validates_uniqueness_of :question_id, scope: :ip

end
