class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :show
  has_many :votes

  validates :body, :show_id, :presence => true

  after_create :set_author_string

  attr_accessible :body, :user_id, :show_id

  def rank
    # not the most efficient way, but prob ok for low n
    return unless show
    show.questions.order("votes_count desc").index(self) + 1
  end

  def vote_up(opts)
    # opts can include :ip or :user_id
    votes.create opts  # can fail silently, not a big deal
  end

  def set_author_string
    if user.present?
      update_attribute :author, "#{user.first_name} #{user.last_name[0]}"
    end
  end

end
