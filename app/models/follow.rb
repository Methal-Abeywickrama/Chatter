class Follow < ApplicationRecord
  belongs_to :follower, class_name: "Profile" ,foreign_key: :follower_id
  belongs_to :followee, class_name: "Profile" ,foreign_key: :followee_id

  validates :followee_id, presence: true
  validates :follower_id, presence: true
  validates :follower_id, uniqueness: { scope: :followee_id  }

  validate :cannot_follow_self

  private 

  def cannot_follow_self
    if follower_id == followee_id 
      errors.add(:followee_id, "Cannot be the same as the follower id")
    end
  end
end
