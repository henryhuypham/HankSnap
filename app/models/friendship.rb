class Friendship < ApplicationRecord
  belongs_to :initiator, class_name: 'User'
  belongs_to :responder, class_name: 'User'

  enum status: [:normal, :blocked]
end
