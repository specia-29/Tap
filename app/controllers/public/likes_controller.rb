class Public::LikesController < ApplicationController

  # def create
  #   article = Article.find(params[:article_id])
  #   like = current_user.likes.new(article_id: article.id)
  #   like.save
  #   redirect_to public_root_path(article)
  # end

  # def destroy
  #   article = Article.find(params[:article_id])
  #   like = current_user.likes.find_by(article_id: article.id)
  #   like.destroy
  #   redirect_to public_root_path(article)
  # end

  def create
    @article = Article.find(params[:article_id])
    @like = Like.new(user_id: @current_user.id, article_id: params[:article_id])
    @like.save
    redirect_to public_article_index_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @like = Like.find_by(user_id: @current_user.id, article_id: params[:article_id])
    @like.destroy
    redirect_to public_article_index_path(@article)
   end

end
