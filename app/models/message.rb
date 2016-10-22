class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  has_and_belongs_to_many :recipient, class_name: 'User', foreign_key: 'received_message_id'
end
