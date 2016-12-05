class UsersController < ApplicationController
  include SessionsHelper

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

  def edit_admin
    @user = User.find(params[:id])
    respond_to do |format|
        format.html {}
        format.js
    end
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

  def update_admin
    @user=User.find(params[:id])
    respond_to do |format|
      @user.skip_password_validation=true
      if @user.update(params.require(:user).permit(:userType, :requesting_admin))
        format.html { redirect_to current_user, notice: 'Admin request accepted' }
        format.json { render :show, status: :ok, location: @user }
      end
    end
  end

  def update_admin_request
    @user=User.find(params[:id])
    respond_to do |format|
      @user.skip_password_validation=true
      if @user.update(params.require(:user).permit(:requesting_admin))
        format.html { redirect_to @user, notice: 'Admin request sent.' }
        format.json { render :show, status: :ok, location: @user }
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
      @user.owned_chatrooms.each do |room|
        @new_owner = -1
        room.users.each do |user|
          if user.id != @user.id
            @new_owner = user.id
            break
          end
        end
        if @new_owner != -1
          room.update(user_id: @new_owner)
        else
          if room.private_chatters.empty?
            Chatroom.find(room).destroy
          else
            room.private_chatters.each do |chatter|
              if chatter.id != @user.id
                room.update(user_id: chatter.id)
              end
            end
          end
        end
      end
      if @user != current_user
        @user.private_chatrooms.each do |room|
          if room.private_chatters.size < 2
            Chatroom.find(room).destroy
          end
        end
        @user.destroy
        redirect_to users_url
      else
        @user.private_chatrooms.each do |room|
          if room.private_chatters.size < 2
            Chatroom.find(room).destroy
          end
        end
        log_out
        @user.destroy
        redirect_to '/'
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :userType, :avatar, :requesting_admin)
    end

end
