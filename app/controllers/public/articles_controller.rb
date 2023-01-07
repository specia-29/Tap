class Public::ArticlesController < ApplicationController
  def top
    @user = User.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.save
    redirect_to public_root_path
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def article_params
    params.require(:article).permit(:body, :post_image, :user_id)
  end

end
