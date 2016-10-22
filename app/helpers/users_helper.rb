module UsersHelper
  def user_avatar_failsafe(user)
    user.avatar_url.present? ? user.avatar_url : 'avatar_default.png'
  end
end
