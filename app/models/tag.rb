class Tag < ApplicationRecord

# 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @article = Article.where("tag LIKE?","#{word}")
    elsif search == "forward_match"
      @article = Article.where("tag LIKE?","#{word}%")
    elsif search == "backward_match"
      @article = Article.where("tag LIKE?","%#{word}")
    elsif search == "partial_match"
      @article = Article.where("tag LIKE?","%#{word}%")
    else
      @article = Article.all
    end
  end

end
