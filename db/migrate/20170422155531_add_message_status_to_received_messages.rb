class AddMessageStatusToReceivedMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :received_messages, :message_status, :boolean, default: false
  end
end
