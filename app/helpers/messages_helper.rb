module MessagesHelper

  def unread?
    self.unread_by(current_user).include?(self)
  end

end
