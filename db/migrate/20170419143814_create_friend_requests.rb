class CreateFriendRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :friend_requests do |t|
      t.integer :friend_sent_id
      t.integer :friend_rec_id
      t.string :status

      t.timestamps
    end
  end
end
