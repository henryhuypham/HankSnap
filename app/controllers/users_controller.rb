class UsersController < ApplicationController
  def authenticate
  end

  def sign_in

  end

  def sign_up
    @user = User.new user_params

    if @user.save
      flash[:success] = 'Welcome to HankSnap!'
      session[:user_id] = @user.id
      redirect_to
    else
      flash[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
