class Profile < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
  # has_many :followers, through: :follows, source: :follower_id, class: "Profile"
  # has_many :followees, through: :follows, source: :followee_id, class: "Profile"

  has_many :follower_relationships, class_name: "Follow", foreign_key: :followee_id
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :followee_relationships, class_name: "Follow", foreign_key: :follower_id
  has_many :followees, through: :followee_relationships, source: :followee
end
