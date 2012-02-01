class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :show
  has_many :votes

  validates :body, :show_id, :presence => true

  attr_accessible :body, :user_id, :show_id

  def vote_up(opts)
    # opts can include :ip or :user_id
    votes.create opts  # can fail silently, not a big deal
  end

  def as_json(opts={})
    super(opts).merge(votes: votes.count)
  end
end
