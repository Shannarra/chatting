class MessagesController < ApplicationController
  before_action :set_chat

  def create
    msg_params = params.expect(message: [ :content ])
    message = Message.new(msg_params)
    message.user = current_user
    message.chat = @chat

    message.save!
    redirect_to @chat
  end

  private
  def set_chat
    @chat = Chat.find params[:chat_id]
  end
end
