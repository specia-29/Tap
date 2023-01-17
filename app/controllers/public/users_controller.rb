class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = @user.articles.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to public_user_path(@user.id)
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

  def stat_update
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :user_name, :birth_date, :phone_number, :is_deleted, :profile_image, :introduction)
  end
end
