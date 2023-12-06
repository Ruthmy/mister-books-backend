class LikeComment < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  after_create :likes_counter
  after_destroy :likes_counter

  validates :user_id, :comment_id, presence: true

  def likes_counter
    comment.update_column(:counter_like, comment.like_comments.count)
  end
end
