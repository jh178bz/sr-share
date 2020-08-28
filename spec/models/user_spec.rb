require 'rails_helper'

RSpec.describe User, type: :model do
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
    expect(FactoryBot.build(:user, name: "longlongname" )).to_not be_valid
  end
end
