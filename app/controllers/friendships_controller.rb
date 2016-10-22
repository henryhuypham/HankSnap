class FriendshipsController < ApplicationController
  before_action :required_login
  helper_method :is_friend_of_current_user

  def index
    @users = User.where.not(id: current_user.id)
  end

  def create
  end

  def block
  end

  def remove
  end

  def is_friend_of_current_user(user)
    Friendship.where(initiator: current_user, responder: user).present?
  end
end
