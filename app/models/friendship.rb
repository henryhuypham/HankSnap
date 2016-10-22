class Friendship < ApplicationRecord
  belongs_to :initiator, class_name: 'User'
  belongs_to :responder, class_name: 'User'

  enum status: [:normal, :blocked]

  def self.create_2_way_friendship(from_user, to_user)
    Friendship.create(initiator: from_user, responder: to_user)
    Friendship.create(initiator: to_user, responder: from_user)
  end

  def self.remove_2_way_friendship(from_user, to_user)
    remove_1_way_friendship(from_user, to_user)
    remove_1_way_friendship(to_user, from_user)
  end

  private

  def self.remove_1_way_friendship(from_user, to_user)
    friendship = Friendship.find_by(initiator_id: from_user.id, responder_id: to_user.id)
    friendship.delete if friendship.present?
  end
end
