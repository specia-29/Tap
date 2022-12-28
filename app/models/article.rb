class Article < ApplicationRecord
  has_one_attached :post_image

  has_many :tags, through: :article_tags
  has_many :article_tags, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
end