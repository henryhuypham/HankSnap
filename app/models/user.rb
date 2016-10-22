class User < ApplicationRecord
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_and_belongs_to_many :received_messages, class_name: 'Message', join_table: 'messages_recipients', foreign_key: 'user_id'
  has_many :initiated_friends, class_name: 'Friendship', foreign_key: 'initiator_id'
  has_many :responded_friends, class_name: 'Friendship', foreign_key: 'responder_id'

  validates_uniqueness_of :email

  has_secure_password
end
