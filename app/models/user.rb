class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :follwers, class_name: "User", foreign_key: "followee_id"
  belongs_to :followee, class_name: "User", optional: true
end
