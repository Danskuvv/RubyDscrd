class CreateFriendships < ActiveRecord::Migration[8.0]
  def change
    create_table :friendships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: true
      t.integer :friendship_status, default: 0, null: false  # e.g., 0: pending, 1: accepted, 2: rejected

      t.timestamps
    end
    
    add_index :friendships, [:user_id, :friend_id], unique: true
  end
end
