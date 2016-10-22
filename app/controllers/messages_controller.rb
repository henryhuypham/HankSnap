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
  end

  def view
    @message = current_user.received_messages.find_by(id: params[:id])
    if @message.present?
      @is_read = @message.read?
      @message.read!
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
end
