class Public::ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def index
    # @article = Article.find(params[:id])
    @articles = Article.all
    @article_comment = ArticleComment.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.save
    redirect_to public_article_index_path(@article.id)
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def like
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
