class MessagesController < ApplicationController
  before_action :required_login

  def inbox
  end

  def sent
    @messages = Message.where(sender: current_user)
  end

  def compose
  end
end
