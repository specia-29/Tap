class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  has_many :articles, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :relationships, foreign_key: 'user_id'
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user
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

# フォロー機能
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

# いいね機能
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

  def active_for_authentication?
    super && (is_deleted == false)
  end

end
