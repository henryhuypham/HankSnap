module MessagesHelper
  def sender_display_name(message)
    "#{message.sender.name}"
  end

  def sent_time(message)
    sent_time = message.created_at
    readable_time_format(sent_time)
  end

  def recipient_name_list(message)
    message.recipients.map { |recipient|
      recipient.name.split.first
    }.reduce('') { |result, name|
      "#{result}#{result.present? ? ', ' : ''}#{name}"
    }
  end

  def read_time(message)
    if message.read?
      read_time = message.updated_at
      readable_time_format(read_time)
    else
      'Unread'
    end
  end

  private

  def readable_time_format(time)
    "#{time.strftime('%b')} #{time.strftime('%e')} - #{time.strftime('%l')}:#{time.strftime('%M')} #{time.strftime('%p')}"
  end
end
