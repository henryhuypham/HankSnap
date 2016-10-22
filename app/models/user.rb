class User < ApplicationRecord
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_and_belongs_to_many :received_messages, class_name: 'Message', join_table: 'messages_recipients', foreign_key: 'user_id'

  validates_uniqueness_of :email

  has_secure_password
end
