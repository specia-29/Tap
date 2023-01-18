class Article < ApplicationRecord

  has_one_attached :post_image

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :post_comments, dependent: :destroy

  validates :post_image, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end