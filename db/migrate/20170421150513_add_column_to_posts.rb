class AddColumnToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :likes, :integer
    add_column :posts, :dislike, :integer
  end
end
