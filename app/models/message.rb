class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  broadcasts_to :chat

  after_create_commit -> {
    broadcast_update_to :message_updates, target: self, partial: "messages/message", locals: { message: self }
  }
end
