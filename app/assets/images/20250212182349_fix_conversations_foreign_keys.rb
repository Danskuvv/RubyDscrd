class FixConversationsForeignKeys < ActiveRecord::Migration[8.0]
  def change
    # Remove the incorrect foreign keys by specifying the column.
    remove_foreign_key :conversations, column: :user1_id
    remove_foreign_key :conversations, column: :user2_id

    # Add the correct foreign keys referencing the "users" table.
    add_foreign_key :conversations, :users, column: :user1_id
    add_foreign_key :conversations, :users, column: :user2_id
  end
end
