class Admin::UsersController < ApplicationController
  def index
    @users = User.all
    # @user = User.find(params[:id])
  end

  def show

  end

  def edit
  end

  def update
  end
end
