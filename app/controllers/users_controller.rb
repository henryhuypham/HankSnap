class UsersController < ApplicationController
  before_action :skip_if_logged_in, only: [:authenticate, :sign_in, :sign_up]

  def authenticate
  end

  def sign_in
    unless (@user = User.find_by(email: params[:email]))
      flash[:error] = 'Error: username or password not found!'
      return redirect_to root_path
    end

    unless @user.authenticate(params[:password])
      flash[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
      return redirect_to root_path
    end

    session[:user_id] = @user.id
    redirect_to messages_inbox_path
  end

  def sign_up
    @user = User.new user_params

    if @user.save
      session[:user_id] = @user.id
      redirect_to messages_inbox_path
    else
      flash[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
      redirect_to root_path
    end
  end

  def sign_out
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
