class RemoveStatusFromReceivedMessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :received_messages, :status
  end
end
