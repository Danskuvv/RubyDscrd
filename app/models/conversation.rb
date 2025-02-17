class Conversation < ApplicationRecord
  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'

  has_many :messages, dependent: :destroy

  # Ensure that a conversation is unique between two users.
  # This method finds or creates a conversation between user_a and user_b.
  def self.between(user_a, user_b)
    conversation = where(user1_id: user_a.id, user2_id: user_b.id)
                   .or(where(user1_id: user_b.id, user2_id: user_a.id)).first
    conversation || create(user1: user_a, user2: user_b)
  end
end