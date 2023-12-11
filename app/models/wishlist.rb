class Wishlist < ApplicationRecord
  belongs_to :user

  validates :book_id, :user_id, presence: true
end
