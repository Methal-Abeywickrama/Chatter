class AddUniquenessIndexToLikes < ActiveRecord::Migration[7.1]
  def change
    add_index :likes, [:profile_id, :likeable_id, :likeable_type], unique: true
  end
end
