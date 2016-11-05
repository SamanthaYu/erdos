class UsersController < ApplicationController

  def index
    @user=User.new
    @users=User.all
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        log_in @user
        redirect_to @user
      else
        flash.now[:danger]="password/email is invalid"
        render 'new'
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
      params.require(:user).permit(:username, :password, :userType)
    end

end
