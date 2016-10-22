class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  has_and_belongs_to_many :recipients, class_name: 'User', join_table: 'messages_recipients', foreign_key: 'message_id'
end
