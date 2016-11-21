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
    respond_to do |format|
      if @user.save
        log_in @user
        if (@user.userType == "Guest")
          format.html { redirect_to chatrooms_url, notice: 'Guest User was successfully created.' }
        else
          format.html { redirect_to @user, notice: 'User was successfully created.' }
        end
        format.json { render json: @user, status: :created, location: @user }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js { render layout: false, content_type: 'text/javascript' }
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
      params.require(:user).permit(:username, :password, :password_confirmation, :userType, :avatar)
    end

end
