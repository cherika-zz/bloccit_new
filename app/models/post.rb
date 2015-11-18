class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  after_create :create_vote
  after_create :create_favorite

  has_many :comments, dependent: :destroy

  has_many :votes, dependent: :destroy

  has_many :labelings, as: :labelable

  has_many :labels, through: :labelings

  has_many :favorites, dependent: :destroy

  default_scope { order('rank DESC') }
  # scope :ordered_by_title, -> { reorder(:title)}
  # scope :ordered_by_reverse_created_at, -> { reorder(created_at: :asc)}

  validates :title, length: {minimum:5}, presence: true
  validates :body, length: {minimum:20}, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)
  end

  def update_rank
   age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
   new_rank = points + age_in_days
   update_attribute(:rank, new_rank)
  end

  private

  def create_vote
    user.votes.create(post: self, value: 1)
  end

  def create_favorite
    Favorite.create(post: self, user: self.user)
    FavoriteMailer.new_post(self).deliver_now
  end
end
