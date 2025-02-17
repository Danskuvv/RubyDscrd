# app/channels/conversation_channel.rb
class ConversationChannel < ApplicationCable::Channel
  def subscribed
    # Stream from a channel specific to this conversation.
    conversation_id = params[:conversation_id]
    stream_from "conversation_#{conversation_id}" if conversation_id.present?
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
