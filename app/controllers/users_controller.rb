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

  def edit #for avatars
    @user = User.find(params[:id])
  end

  def edit_password
    @user = User.find(params[:id])
  end

  def update_password
    @user=User.find(params[:id])
    @user.skip_password_validation=false
    respond_to do |format|
      if @user.update_attributes(params.require(:user).permit(:password,:password_confirmation))
        format.html { redirect_to @user, notice: 'User password was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit_password }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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

  def update #for avatars
    @user=User.find(params[:id])
    respond_to do |format|
      @user.skip_password_validation=true
      if @user.update(params.require(:user).permit(:avatar,:remove_avatar))
        format.html { redirect_to @user, notice: 'User avatar was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
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
      params.require(:user).permit(:username, :password, :password_confirmation, :userType,:avatar)
    end

end
