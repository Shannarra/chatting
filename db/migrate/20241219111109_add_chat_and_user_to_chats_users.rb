class AddChatAndUserToChatsUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :chats_users do |t|
      t.references :user
      t.references :chat

      t.timestamps
    end
  end
end
