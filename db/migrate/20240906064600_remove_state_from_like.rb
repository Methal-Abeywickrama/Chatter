class RemoveStateFromLike < ActiveRecord::Migration[7.1]
  def change
    remove_column :likes, :state, :boolean
  end
end
