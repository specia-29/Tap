class Public::CommentsController < ApplicationController

  def create
    article = Article.find(params[:article_id])
    comment = current_user.post_comments.new(comment_params)
    comment.article_id = article.id
    comment.save
    redirect_to public_article_path(article)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
