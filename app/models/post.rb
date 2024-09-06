class Post < ApplicationRecord
  belongs_to :profile
  has_many :comments, as: :commentable, dependent: :destroy
end
