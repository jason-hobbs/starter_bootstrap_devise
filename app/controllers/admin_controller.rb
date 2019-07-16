# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  skip_before_action :verify_authenticity_token, only: [:update], if: -> { params[:avatar] }

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      format.html { render :edit }
      format.js { render :edit }
    end
  end

  def update
    @user = User.find(params[:id])
    @user.slug = nil
    if @user.update_without_password(user_params)
      if params[:user][:password]
        @user.password = params[:user][:password]
        @user.password_confirmation = params[:user][:password_confirmation]
        @user.reset_password_token = 'temp'
        @user.save
      end
      redirect_to admin_index_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'Account deleted!'
    redirect_to admin_index_path
  end

  def confirm
    user = User.find(params[:id])
    user.confirmed_at = Date.today
    user.save!
    flash[:success] = 'User confirmed'
    redirect_to admin_index_path
  end

  def unlock
    user = User.find(params[:id])
    user.unlock_access!
    flash[:success] = 'User unlocked'
    redirect_to admin_index_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin, :avatar)
  end
end
