class CreateFollows < ActiveRecord::Migration[7.1]
  def change
    create_table :follows do |t|
      t.references :follower, null: false, foreign_key: { to_table: :profiles }
      t.references :followee, null: false, foreign_key: { to_table: :profiles }

      t.timestamps

    end
    add_index :follows, [:follower_id, :followee_id], unique: true
  end
end
