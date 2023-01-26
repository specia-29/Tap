class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @users = User.all
    # @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.all.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user)
      flash[:notice_update] = "ジャンル情報を更新しました！"
    else
      @users = User.all
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :user_name, :birth_date, :phone_number, :is_deleted, :profile_image, :introduction)
  end
end
