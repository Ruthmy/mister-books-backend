class Comment < ApplicationRecord
  belongs_to :user
  has_many :like_comments, dependent: :destroy

  validates :comment, :book_id, :counter_like, presence: true
  validates :comment, length: { maximum: 500 }
end
