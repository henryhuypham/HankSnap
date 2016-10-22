class CreateJoinTableUserMessage < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :messages, table_name: :messages_recipients do |t|
      t.index :user_id
      t.index :message_id
      t.index [:user_id, :message_id]
      t.index [:message_id, :user_id]
    end
  end
end
