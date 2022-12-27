class Public::UsersController < ApplicationController
  def show
  end

  def edit
  end

  def update
  end

  def followed
  end

  def follower
  end

  def stat_update
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :user_name, :birth_date, :phone_number, :is_deleted)
  end
end
