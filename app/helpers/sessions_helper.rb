module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||=User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def loggedinredirect
    if logged_in?
      redirect_to chatrooms_path
    end
  end


  def log_out
    begin
      if User.find(session[:user_id]).userType == 'Guest'
        User.find(session[:user_id]).private_chatrooms.each do |room|
          if room.private_chatters.size < 2
            Chatroom.find(room).destroy
          end
        end
        User.find(session[:user_id]).destroy
      end
    rescue
    end
    session.delete(:user_id)
    @current_user = nil
  end

  def emojime(content)
    EmojiParser.parse(content) do |emoji|
      '<img src="/'+emoji.image_filename+'" alt=":'+emoji.name+':">'
    end
  end
end
