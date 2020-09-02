require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:user2) { create(:user, name: "user2", email: "testuser2@example.com") }
# 名前、email、passwordがあれば有効
  it "is valid with a name, email, password" do
    expect(FactoryBot.build(:user)).to be_valid
  end
  # 名前なければ無効
  it "is invalid without a name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors.added?(:name, :blank)).to be_truthy
  end
  # メールなければ無効
  it "is invalid without an email" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors.added?(:email, :blank)).to be_truthy
  end
  # パスワードなければ無効
  it "is invalid without a password" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors.added?(:password, :blank)).to be_truthy
  end
  # メール重複していたら無効
  it "is invalid without a duplicate email" do
    FactoryBot.create(:user, email: "guest@example.com")
    expect(FactoryBot.build(:user, email: "guest@example.com")).to_not be_valid
  end
  # 6文字以下のパスワードは無効
  it "is invalid 6 characters or less a password" do
    expect(FactoryBot.build(:user, password: "pass" )).to_not be_valid
  end
  # 10文字以上の名前は無効
  it "is invalid 10 characters or more a name" do
    expect(FactoryBot.build(:user, name: "a" * 10 + "name" )).to_not be_valid
  end

  context 'user follow' do
    # defaultではfollowしていない
    it "usually not follow" do
      expect(user.following?(user2)).to_not be_truthy
    end
    # userはfollowできる
    it "user can follow a user2" do
      user.follow(user2)
      expect(user.following?(user2)).to be_truthy
    end
    # userはフォロー外せる
    it "user can unfollow a user2" do
      user.follow(user2)
      user.unfollow(user2)
      expect(user.following?(user2)).to_not be_truthy
    end
  end
end
