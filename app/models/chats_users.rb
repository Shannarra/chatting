class ChatsUsers < ApplicationRecord
  has_one :user
  has_one :chat
end
