class Read < ApplicationRecord
  belongs_to :user

  validates :user_id, :book_id, presence: true
end
