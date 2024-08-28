class Profile < ApplicationRecord
  belongs_to :user
  has_many :follwers, class_name: "User", foreign_key: "followee_id"
  belongs_to :followee, class_name: "User", optional: true
end
