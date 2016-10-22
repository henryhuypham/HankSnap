module MessagesHelper
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
      "#{read_time.strftime('%b')} #{read_time.strftime('%e')} - #{read_time.strftime('%l')}:#{read_time.strftime('%M')} #{read_time.strftime('%p')}"
    else
      'Unread'
    end
  end
end
