class User < ApplicationRecord
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :name, presence: true, length: { maximum: 10 }
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # テストユーザーを簡単ログインさせる
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'テストユーザー'
    end
  end

  # ユーザーをフォローする
  def follow(other_user)
    following << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

  # アイテムをお気に入りに登録する
  def favorite(item)
    Favorite.create(user_id: id, item_id: item.id)
  end

  # アイテムをお気に入り解除する
  def unfavorite(item)
    Favorite.find_by(user_id: id, item_id: item.id).destroy
  end

  # 現在のユーザーがお気に入り登録してたらtrueを返す
  def favorite?(item)
    !Favorite.find_by(user_id: id, item_id: item.id).nil?
  end
end
