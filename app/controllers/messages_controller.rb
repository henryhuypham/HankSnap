class MessagesController < ApplicationController
  before_action :required_login

  def inbox
    @messages = current_user.received_messages.order(created_at: :desc)
  end

  def sent
    @messages = current_user.sent_messages.order(created_at: :desc)
  end

  def compose
  end
end
