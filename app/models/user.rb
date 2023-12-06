class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :like_comments, dependent: :destroy
  has_many :read, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :name, :avatar, :bio, :country, presence: true
  validates :name, length: { maximum: 50 }
  validates :bio, length: { maximum: 160 }
  validates :country, length: { maximum: 100 }
  # Pendiente de agregar Avatar
end
