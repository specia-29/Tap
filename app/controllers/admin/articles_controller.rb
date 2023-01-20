class Admin::ArticlesController < ApplicationController

  before_action :authenticate_admin!

  def show
    @article = Article.find(params[:id])
    @user = @article.user.id
    @post_comment = PostComment.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to admin_article_path(@article.id)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_users_path
  end

  private
  def article_params
    params.require(:article).permit(:body, :post_image, :user_id, :article_id)
  end
end
