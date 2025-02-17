class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  # Use enum to manage friendship status:
  enum(:friendship_status, { pending: 0, accepted: 1, rejected: 2 })
end
