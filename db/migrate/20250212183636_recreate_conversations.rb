class RecreateConversations < ActiveRecord::Migration[8.0]
  def change
    create_table :conversations do |t|
      t.integer :user1_id, null: false
      t.integer :user2_id, null: false
      t.timestamps
    end

    add_index :conversations, :user1_id
    add_index :conversations, :user2_id

    add_foreign_key :conversations, :users, column: :user1_id
    add_foreign_key :conversations, :users, column: :user2_id
  end
end
