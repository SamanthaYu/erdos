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
    respond_to do |format|
      if @user.save
        login_url
        redirect_to @user
      else
        render 'new'
      end
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
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

end
