class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  has_many :articles, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_articles, through: :likes, source: :article
  # has_many :relation_ships, dependent: :destroy
  # has_many :likes, dependent: :destroy

  def already_liked?(article)
    self.likes.exists?(article_id: article.id)
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end

# 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("user_name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("user_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("user_name LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("user_name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end

end
