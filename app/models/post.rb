class Post < ApplicationRecord
  belongs_to :profile
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_one_attached :image

  validates :image, presence: true, if: -> { body.blank? }
end
