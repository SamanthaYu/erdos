module MessagesHelper

  def unread?(user)
    self.unread_by(user).include?(self)
  end

end
