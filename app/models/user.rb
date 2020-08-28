class User < ApplicationRecord
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = 'password'
      user.name = 'テストユーザー'
    end
  end
end
