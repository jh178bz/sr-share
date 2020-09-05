require 'rails_helper'

RSpec.describe Review, type: :model do
  let!(:user) { create(:user) }
  let!(:item) { create(:item) }
  let(:review) { create(:review, user_id: user.id, item_id: item.id) }
  # 有効な投稿
  it "is valid with title, content, rate, user_id, item_id" do
    expect(review).to be_valid
  end
  # 画像は無くても有効
  it "is valid if without image" do
    invalid_review = build(:review, user_id: user.id, item_id: item.id, image: nil)
    expect(invalid_review).to be_valid
  end
  # タイトル無ければ無効
  it "is invalid without title" do
    invalid_review = build(:review, user_id: user.id, item_id: item.id, title: nil)
    invalid_review.valid?
    expect(invalid_review.errors.added?(:title, :blank)).to be_truthy
  end
  # content無ければ無効
  it "is invalid without content" do
    invalid_review = build(:review, user_id: user.id, item_id: item.id, content: nil)
    invalid_review.valid?
    expect(invalid_review.errors.added?(:content, :blank)).to be_truthy
  end
  # item_id無ければ無効
  it "is invalid without item_id" do
    invalid_review = build(:review, user_id: user.id, item_id: nil)
    invalid_review.valid?
    expect(invalid_review.errors.added?(:item_id, :blank)).to be_truthy
  end
  # user_id無ければ無効
  it "is invalid without user_id" do
    invalid_review = build(:review, user_id: nil, item_id: item.id)
    invalid_review.valid?
    expect(invalid_review.errors.added?(:user_id, :blank)).to be_truthy
  end
  # 評価が無ければ無効
  it "is invalid without rate" do
    invalid_review = build(:review, user_id: user.id, item_id: item.id, rate: nil)
    invalid_review.valid?
    expect(invalid_review.errors.added?(:rate, :blank)).to be_truthy
  end
  # 評価が0.5刻みでも有効
  it "is valid when rate harf" do
    expect(build(:review, rate: 1.5, user_id: user.id, item_id: item.id)).to be_valid
  end
  # contentは200文字以内
  it "is invalid 200 characters or more a content" do
    expect(build(:review, content: "a" * 200 + "comment")).to_not be_valid
  end
end
