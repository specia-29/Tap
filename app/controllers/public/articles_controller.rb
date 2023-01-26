class Public::ArticlesController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]

  def new
    @article = Article.new
  end

  def index
    @articles = Article.where(user_id: [current_user.id, *current_user.following_ids]).order(created_at: :desc)
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to public_articles_path
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
    @user = @article.user.id
    @post_comment = PostComment.new
  end

  def edit
    @article = Article.find(params[:id])
    if @article.user == current_user
    else
      redirect_to public_article_path
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to public_article_path(@article.id)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to public_user_path(current_user)
  end

  private
  def article_params
    params.require(:article).permit(:body, :post_image, :user_id, :article_id)
  end

end
