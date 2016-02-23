class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @users = User.all
  end

  def edit
    @user = User.friendly.find(params[:format])
  end

  def update
    @user = User.friendly.find(params[:format])
    @user.slug = nil
    if @user.update_without_password(user_params)
      if params[:user][:password]
        @user.password = params[:user][:password]
        @user.password_confirmation = params[:user][:password_confirmation]
        @user.reset_password_token = 'temp'
        @user.save
      end
      redirect_to admin_path, :gflash => { :success => "Account updated!" }
    else
      render :edit
    end
  end

  def destroy
    @user = User.friendly.find(params[:format])
    @user.destroy
    redirect_to admin_path, :gflash => { :success => "Account deleted!" }
  end

  def confirm
    user = User.find(params[:id])
    user.confirmed_at = Date.today
    user.save!
    redirect_to admin_path, :gflash => { :success => "User Confirmed" }
  end

  def unlock
    user = User.find(params[:id])
    user.unlock_access!
    redirect_to admin_path, :gflash => { :success => "User Unlocked" }
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin)
  end

end
