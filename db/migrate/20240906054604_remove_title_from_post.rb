class RemoveTitleFromPost < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :title, :text
  end
end
