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
    if @user.update_without_password(user_params)
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

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin)
  end

end
