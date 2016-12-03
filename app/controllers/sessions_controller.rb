class SessionsController < ApplicationController

  def new
    loggedinredirect
  end

  def create
    loggedinredirect
    user=User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      if user.userType == 'Guest'
        flash.now[:notice] = "User not found"
        render :new
      else
        log_in user
        redirect_to chatrooms_path
      end
    else
      if !user
        flash.now[:notice] = "User not found"
      else
        flash.now[:notice] = "Incorrect password"
      end
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
