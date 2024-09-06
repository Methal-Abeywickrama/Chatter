class ChangeUserReferenceToProfileInComments < ActiveRecord::Migration[7.1]
  def change
    # Remove the existing `user` reference
    remove_reference :comments, :user, foreign_key: true

    # Add the new `profile` reference
    add_reference :comments, :profile, null: false, foreign_key: true
  end
end
