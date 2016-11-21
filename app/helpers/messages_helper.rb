module MessagesHelper
  include LocalTime

  def reltime(time)
    return LocalTime::local_time_ago(message.created_at)
  end
end
