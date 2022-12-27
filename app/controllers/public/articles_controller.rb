class Public::ArticlesController < ApplicationController
  def top
    @user = User.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def like
  end

  private
  def user_params
    params.require(:article).permit(:body, :image, :user_id)
  end

end
