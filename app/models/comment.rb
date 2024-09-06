class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :profile
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id', dependent: :destroy
  belongs_to :parent, class_name: 'Comment', optional: true
  belongs_to :post, optional: true
  
  # Ensure comments cannot reply to themselves
  validate :parent_cannot_be_self
  
  private

  def parent_cannot_be_self
    return if parent.nil? 
    puts 'parent is'
    p parent_id
    errors.add(:parent_id, "can't be the same as the comment") if parent_id == id
  end
end
