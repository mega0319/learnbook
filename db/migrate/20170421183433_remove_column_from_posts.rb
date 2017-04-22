class RemoveColumnFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :likes
    remove_column :posts, :dislike
  end
end
