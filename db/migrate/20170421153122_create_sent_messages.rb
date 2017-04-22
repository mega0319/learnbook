class CreateSentMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :sent_messages do |t|
      t.integer :user_sent
      t.integer :user_received
      t.integer :message_id
      t.string :status
    end
  end
end
