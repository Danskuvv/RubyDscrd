class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    # Try to get the friend either by the friend_id (if provided) or by friend_email
    friend = if params[:friend_email].present?
               User.find_by(email: params[:friend_email])
             else
               User.find(params[:friend_id])
             end

    if friend.nil?
      flash[:alert] = "No user found with that email."
      return redirect_to root_path
    end

    # Prevent sending a friend request to yourself
    if friend == current_user
      flash[:alert] = "You cannot send a friend request to yourself."
      return redirect_to root_path
    end

    # Check if a friendship (or friend request) already exists in either direction
  existing_friendship = Friendship.where(user_id: current_user.id, friend_id: friend.id)
  .or(Friendship.where(user_id: friend.id, friend_id: current_user.id))
  .first

  if existing_friendship.present?
  flash[:alert] = "A friend request or friendship already exists with #{friend.email}."
  return redirect_to root_path
  end

  # Build and save the new friendship (which will have the default 'pending' status)
  friendship = current_user.friendships.build(friend: friend)
  if friendship.save
  flash[:notice] = "Friend request sent to #{friend.email}."
  else
  flash[:alert] = "Unable to send friend request."
  end
  redirect_to root_path
  end

  def update
    friendship = Friendship.find(params[:id])
    # Use the friendship_status value from the submitted parameters.
    new_status = params.dig(:friendship, :friendship_status)
    
    if new_status.blank?
      flash[:alert] = "Invalid action."
    elsif friendship.update(friendship_status: new_status)
      flash[:notice] = "Friend request #{new_status}."
    else
      flash[:alert] = "Unable to update friend request."
    end
    
    redirect_to root_path
  end
  

  def destroy
    friendship = Friendship.find(params[:id])
    friendship.destroy
    flash[:notice] = "Friendship removed."
    redirect_to root_path
  end

  # Optionally, an index action to show friend requests or friends list
  def index
    # Pending friend requests where current_user is the recipient
    @friend_requests = current_user.inverse_friendships.pending
  
    # Accepted friendships initiated by current_user: map the friend from each friendship.
    accepted_direct = current_user.friendships.accepted.map(&:friend)
  
    # Accepted friendships where current_user is the recipient: map the user from each inverse friendship.
    accepted_inverse = current_user.inverse_friendships.accepted.map(&:user)
  
    # Combine both arrays of User records
    @friends = accepted_direct + accepted_inverse
  end
end
