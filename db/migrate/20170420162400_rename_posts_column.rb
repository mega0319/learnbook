class RenamePostsColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :profile_id, :user_id

  end
end
