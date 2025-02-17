class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = current_user.conversations
  end

  def show
    @conversation = Conversation.find(params[:id])
    # Ensure the current user is a participant
    unless [@conversation.user1_id, @conversation.user2_id].include?(current_user.id)
      redirect_to conversations_path, alert: "Not authorized."
    end
    @messages = @conversation.messages.order(:created_at)
  end

  # Optionally, create a new conversation (or find an existing one)
  def create
    # For example, if a user selects a friend (by ID) to chat with:
    friend = User.find(params[:friend_id])
    @conversation = Conversation.between(current_user, friend)
    redirect_to conversation_path(@conversation)
  end

  def messages
    @conversation = Conversation.find(params[:id])
    # You might want to ensure the current user is a participant
    render partial: 'messages/messages', locals: { conversation: @conversation, current_user: current_user }
  end
  
end
