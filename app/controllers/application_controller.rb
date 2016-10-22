class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def signed_in?
    current_user.present?
  end

  def required_login
    unless signed_in?
      flash[:error] = 'You must sign in to see this page!'
      redirect_to root_path
    end
  end

  def skip_if_logged_in
    redirect_to messages_inbox_path if signed_in?
  end
end
