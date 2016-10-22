class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.references :initiator, index: true
      t.references :responder, index: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
