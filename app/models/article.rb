class Article < ApplicationRecord

  has_one_attached :post_image

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  # has_many :tags, through: :article_tags
  # has_many :article_tags, dependent: :destroy

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end