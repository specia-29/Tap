class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.all.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
    if user_signed_in? && @user.id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to public_user_path(current_user)
    else
      redirect_to edit_public_user_path(current_user)
    end
  end

  def following
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :user_name, :birth_date, :phone_number, :is_deleted, :profile_image, :introduction)
  end
end
