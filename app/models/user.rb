class User < ApplicationRecord
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_and_belongs_to_many :received_messages, class_name: 'Message', foreign_key: 'recipient_id'

  has_secure_password
end
