class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  has_and_belongs_to_many :chats
  has_many :messages, through: :chats

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  enum :profile_type, {
         user: 0,
         admin: 3
       }

  def in_chat?(chat)
    self.chats.include? chat
  end

  def enroll_chat!(chat)
    return if in_chat? chat

    self.chats.push chat
  end

  def exit_chat!(chat)
    return unless in_chat? chat

    self.chats.destroy(chat)
  end
end
