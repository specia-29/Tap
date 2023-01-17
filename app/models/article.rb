class Article < ApplicationRecord

  has_one_attached :post_image

  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :comments

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

end