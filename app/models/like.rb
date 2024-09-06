class Like < ApplicationRecord
  belongs_to :profile
  belongs_to :likeable, polymorphic: true

  validates :profile_id, uniqueness: { scope: [:likeable_id, :likeable_type], message: 'can only like this once' }
end
