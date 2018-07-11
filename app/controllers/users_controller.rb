class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:update]
  def show
    @user = current_user
    @posts = current_user.posts.order('created_at DESC').page(params[:page]).per(4)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update user_params
    redirect_to user_path @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :bio, :company, :avatar)
  end

end
