class RemoveFaultyForeignKeyFromFriendships < ActiveRecord::Migration[8.0]
  def change
    # Remove the foreign key referencing the non-existent "friends" table.
    remove_foreign_key :friendships, "friends"
  end
end