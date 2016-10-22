class FriendshipsController < ApplicationController
  before_action :required_login
  helper_method :is_friend_of_current_user, :is_blocked_by_current_user

  def index
    @users = User.where.not(id: current_user.id)
  end

  def create
    perform_action_on_target_user(user_params) { |target_user|
      Friendship.create_2_way_friendship(current_user, target_user)
    }
  end

  def block
    perform_action_on_target_user(user_params) { |target_user|
      friendship = Friendship.find_by(initiator_id: current_user.id, responder_id: target_user.id)
      friendship.blocked!
    }
  end

  def unblock
    perform_action_on_target_user(user_params) { |target_user|
      friendship = Friendship.find_by(initiator_id: current_user.id, responder_id: target_user.id)
      friendship.normal!
    }
  end


  def remove
    perform_action_on_target_user(user_params) { |target_user|
      Friendship.remove_2_way_friendship(current_user, target_user)
    }
  end

  def is_friend_of_current_user(user)
    Friendship.exists?(initiator: current_user, responder: user)
  end

  def is_blocked_by_current_user(user)
    friendship = Friendship.find_by(initiator_id: current_user.id, responder_id: user.id)

    if friendship.present?
      friendship.blocked?
    else
      false
    end
  end

  private

  def user_params
    params.require(:user).permit(:id)
  end

  def perform_action_on_target_user(user_params)
    target_user = User.find_by(id: user_params[:id])

    if target_user.present?
      yield target_user
    else
      flash[:error] = "User doesn't exist"
    end

    redirect_to friendships_index_path
  end
end
