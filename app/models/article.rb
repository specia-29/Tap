class Article < ApplicationRecord

  has_one_attached :post_image

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  # has_many :comments, dependent: :destroy
  # has_many :tags, through: :article_tags
  # has_many :article_tags, dependent: :destroy
end