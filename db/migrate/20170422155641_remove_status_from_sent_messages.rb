class RemoveStatusFromSentMessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :sent_messages, :status
  end
end
