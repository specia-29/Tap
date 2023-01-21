class Public::FavoritesController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    favorite = current_user.favorites.new(article_id: article.id)
    favorite.save
    redirect_to public_article_path(article)
  end

  def destroy
    article = Article.find(params[:article_id])
    favorite = current_user.favorites.find_by(article_id: article.id)
    favorite.destroy
    redirect_to public_article_path(article)
  end

  def index
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:article_id)
    @favorite_articles = Article.find(favorites)
  end

end
