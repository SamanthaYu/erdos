class UsersController < ApplicationController
    layout 'signup', only: [:new, :create]

  def index
    @user=User.new
    @users=User.all
  end

  def new
    loggedinredirect
    @user = User.new
  end

  def create
    loggedinredirect
    @user = User.new(user_params)
    if @user.save
      log_in @user
      if (@user.userType == "Guest")
        redirect_to chatrooms_url
      else
        redirect_to @user
      end
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.present?
      @user.destroy
    end
    redirect_to users_url
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :userType, :avatar)
    end

end
