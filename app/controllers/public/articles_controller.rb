class Public::ArticlesController < ApplicationController

  before_action :authenticate_user!, only: [:show, :create]

  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.save
    redirect_to public_articles_path
  end

  def show
    @article = Article.find(params[:id])
    @like = Like.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def likes
    @user = User.find_by(params[:id])
    @likes = Liked.where(@user.id)
  end

  def update
  end

  def destroy
  end

  private
  def article_params
    params.require(:article).permit(:body, :post_image, :user_id, :article_id)
  end

end
