require 'rails_helper'

RSpec.describe Item, type: :model do
  # 2つ合ったら有効
  it "is valid with a name, content" do
    expect(FactoryBot.build(:item)).to be_valid
  end
  # 名前なければ無効
  it "is invalid without a name" do
    item = FactoryBot.build(:item, name: nil)
    item.valid?
    expect(item.errors.added?(:name, :blank)).to be_truthy
  end
  # 同じ名前は無効
  it "is invalid without a duplicate name" do
    FactoryBot.create(:item, name: "テストタイヤ")
    expect(FactoryBot.build(:item, name: "テストタイヤ")).to_not be_valid
  end
  # 名前が30以上は無効
  it "is invalid 30 characters or more a name" do
    expect(FactoryBot.build(:item, name: "a" * 30 + "name")).to_not be_valid
  end
  # content無ければ無効
  it "is invalid without a content" do
    item = FactoryBot.build(:item, content: nil)
    item.valid?
    expect(item.errors.added?(:content, :blank)).to be_truthy
  end
  # content300以上は無効
  it "is invalid 300 characters or more a content" do
    expect(FactoryBot.build(:item, content: "a" * 300 + "comment")).to_not be_valid
  end
  # 画像なしでも有効
  it "is valid not without a image" do
    item = FactoryBot.build(:item, image: nil)
    item.valid?
    expect(item.errors.added?(:image, :blank)).to_not be_truthy
  end
end
