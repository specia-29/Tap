class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  has_many :articles, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  has_many :post_comments, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true,
  format: { with: /\A([ァ-ン]|ー)+\z/, message: "is must NOT contain any other characters than alphanumerics." }
  validates :first_name_kana, presence: true,
  format: { with: /\A([ァ-ン]|ー)+\z/, message: "is must NOT contain any other characters than alphanumerics." }
  validates :user_name, presence: true
  validates :birth_date, presence: true
  validates :phone_number, presence: true


  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(follower_id: other_user.id)
  end


  def already_favorited?(article)
    self.favorites.exists?(article_id: article.id)
  end

# 検索方法分岐
  def self.looks(search, word)
    if search == "partial_match"
      @user = User.where("user_name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.last_name = 'ゲスト'
      user.first_name = 'ログイン'
      user.last_name_kana = 'ゲスト'
      user.first_name_kana = 'ログイン'
      user.user_name = 'guest_sign_in'
      user.birth_date = '2023-1-20'
      user.phone_number = '00000000000'
      user.introduction = 'ゲストログイン中'
    end
  end

end
