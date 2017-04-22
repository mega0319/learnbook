class CreateDislikes < ActiveRecord::Migration[5.0]
  def change
    create_table :dislikes do |t|
      t.integer :post_id
      t.integer :user_id
    end
  end
end
