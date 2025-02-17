class HomeController < ApplicationController
  def index
    if user_signed_in?
      @friend_requests = current_user.inverse_friendships.pending
      accepted_direct = current_user.friendships.accepted.map(&:friend)
      accepted_inverse = current_user.inverse_friendships.accepted.map(&:user)
      @friends = accepted_direct + accepted_inverse

      if params[:conversation_id].present?
        @current_conversation = Conversation.find(params[:conversation_id])
      else
        @current_conversation = nil
      end
    end
  end
end