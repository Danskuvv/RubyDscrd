class MessagesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.sender = current_user
    if @message.save
      #  ActionCable.server.broadcast "conversation_#{@conversation.id}",   ##### ActionCable solution Removed for now because didnt work
      #    message: render_message(@message, current_user)

      # Turbo::StreamsChannel.broadcast_append_to(                       ###### Turbo solution removed for now because didnt work
      # @conversation,
      # target: "chat-messages",
      # partial: "messages/message",
      # locals: { message: @message, current_user: current_user },
      # stream: "conversation_#{@conversation.id}"
      # )
      flash[:notice] = "Message sent."
    else
      flash[:alert] = "Failed to send message."
    end
    redirect_to root_path(conversation_id: @conversation.id)

    # respond_to do |format|
    #   format.turbo_stream
    #   format.html { redirect_to root_path(conversation_id: @conversation.id) }     ###### Turbo solution removed for now because didnt work
    #end
  end

  private
  
  def message_params
    params.require(:message).permit(:body)
  end
  
  # # This helper renders the partial for a message and passes the current_user as a local.        #####Removed for now because didnt work
  # def render_message(message, user)
  #   ApplicationController.render(
  #     partial: 'messages/message',
  #     locals: { message: message, current_user: user }
  #   )
  # end
  
    # RIGHT NOW THE TURBO OR ACTIONCABLE SOLUTIONS ARE NOT WORKING, SO WE ARE JUST USING POLLING TO REFRESH THE PAGE ON THE RECEIVING END, AND ON THE SENDING END
    # WE ARE JUST REDIRECTING TO THE SAME PAGE. THIS IS NOT IDEAL SINCE THE PAGE REFRESHES, BUT IT WORKS FOR NOW.
    # THE TURBO SOLUTION IS PREFERRED BECAUSE IT IS MORE EFFICIENT, BUT IT IS NOT WORKING RIGHT NOW.
end
