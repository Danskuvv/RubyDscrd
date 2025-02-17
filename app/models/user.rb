class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    # Friendships initiated by this user
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  # Friendships where the user is the recipient
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy
  has_many :inverse_friends, through: :inverse_friendships, source: :user     

  # Conversations where the user is user1
  has_many :conversations_as_user1, class_name: 'Conversation', foreign_key: 'user1_id', dependent: :destroy

  # Conversations where the user is user2
  has_many :conversations_as_user2, class_name: 'Conversation', foreign_key: 'user2_id', dependent: :destroy

  # A method to get all conversations for the user:
  def conversations
    Conversation.where("user1_id = ? OR user2_id = ?", id, id)
  end
  
end
