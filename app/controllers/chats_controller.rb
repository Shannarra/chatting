class ChatsController < ApplicationController
  before_action :set_chat, only: %i[ show edit update destroy enroll ]

  # GET /chats or /chats.json
  def index
    @chats = current_user.chats
  end

  # GET /chats/1 or /chats/1.json
  def show
    authorize @chat
  end

  def enroll
    current_user.enroll_chat!(@chat)
    redirect_to chats_url
  end

  def public
    @public_chats = Chat.public_chat - current_user.chats

    render "publics"
  end

  # GET /chats/new
  def new
    @chat = Chat.new
    authorize @chat
  end

  # GET /chats/1/edit
  def edit
  end

  # POST /chats or /chats.json
  def create
    @chat = Chat.new(chat_params)
    # The user that creates the chat should be a part of it by definition
    @chat.users = [ current_user ]

    authorize @chat

    respond_to do |format|
      if @chat.save
        format.html { redirect_to @chat, notice: "Chat was successfully created." }
        format.json { render :show, status: :created, location: @chat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chats/1 or /chats/1.json
  def update
    authorize @chat

    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to @chat, notice: "Chat was successfully updated." }
        format.json { render :show, status: :ok, location: @chat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1 or /chats/1.json
  def destroy
    authorize @chat
    @chat.destroy!

    respond_to do |format|
      format.html { redirect_to chats_path, status: :see_other, notice: "Chat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def chat_params
      params.expect(chat: [ :name ])
    end
end
