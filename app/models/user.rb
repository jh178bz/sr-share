class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 10 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'テストユーザー'
    end
  end
end
