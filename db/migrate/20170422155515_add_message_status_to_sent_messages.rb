class AddMessageStatusToSentMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :sent_messages, :message_status, :boolean, default: false
  end
end
