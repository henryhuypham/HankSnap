class MessagesController < ApplicationController
  before_action :required_login
  before_action :is_recipient_of_message, only: :view

  def inbox
    @messages = current_user.received_messages.order(created_at: :desc)
  end

  def sent
    @messages = current_user.sent_messages.order(created_at: :desc)
  end

  def compose
    @friends = current_user.initiated_friends.where(status: :normal)
  end

  def send_message
    send_message_param

    unless (@recipient = User.find_by(email: params[:message][:recipient]))
      flash[:error] = 'Error: no such email found in the system!'
      return redirect_to messages_compose_path
    end

    Message.create(subject: params[:message][:subject], content: params[:message][:content], sender: current_user, recipients: [@recipient])
    flash[:success] = 'Message sent successfully!'
    redirect_to messages_sent_path
  end

  def view
    @message = current_user.received_messages.find_by(id: params[:id])
    if @message.present?
      @is_read = @message.read?

      unless @is_read
        @message.read!
      end
    end
  end

  private

  def is_recipient_of_message
    params.require(:id)
    unless current_user.received_messages.exists?(id: params[:id])
      flash[:error] = 'Error: message not found!'
      redirect_to messages_inbox_path
    end
  end

  def send_message_param
    params.require(:message).permit(:subject, :recipient, :content)
  end
end
