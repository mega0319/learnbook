class RenameColumnNamesInFriendRequestsAgain < ActiveRecord::Migration[5.0]
  def change
    rename_column :friend_requests, :user_id, :sender_id
    rename_column :friend_requests, :friend_id, :receiver_id
  end
end
