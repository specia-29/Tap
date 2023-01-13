class Public::LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_like

    def create
        user = current_user
        article = Article.find(params[:article_id])
        like = Like.create(user_id: user.id, article_id: article.id)
    end

    def destroy
        user = current_user
        article = Article.find(params[:article_id])
        like = Like.find_by(user_id: user.id, article_id: article.id)
        like.delete
    end

    private
    def set_like
        @article = Article.find(params[:article_id])
    end
end
