class RenameColumnInFriendRequests < ActiveRecord::Migration[5.0]
  def change
      rename_column :friend_requests, :friend_sent_id, :user_id
      rename_column :friend_requests, :friend_rec_id, :friend_id
  end
end
