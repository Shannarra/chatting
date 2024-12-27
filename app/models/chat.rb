class Chat < ApplicationRecord
  has_many :messages, dependent: :destroy

  after_update_commit -> { broadcast_update_to :chat_updates, target: self, partial: "chats/chat", locals: { chat: self } }

  has_and_belongs_to_many :users

  enum :chat_type, {
         public_chat: 0,
         private_chat: 1
       }
end
