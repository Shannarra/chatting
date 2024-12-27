class AddChatTypeToChat < ActiveRecord::Migration[8.0]
  def change
    add_column :chats, :chat_type, :integer, default: 0
  end
end
