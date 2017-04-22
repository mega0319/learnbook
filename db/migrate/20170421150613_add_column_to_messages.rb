class AddColumnToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :message_content, :text

  end
end
