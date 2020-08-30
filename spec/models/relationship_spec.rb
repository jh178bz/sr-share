require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let!(:user) { create(:user) }
  let!(:followed_user) { create(:user, name: "ユーザー２", email: "testuser@example.com") }
  # 有効なrelationship
  it "is relationship valid" do
    relationship = Relationship.new(followed_id: followed_user.id, follower_id: user.id )
    expect(relationship).to be_valid
  end
  # 無効なrelationship
  it "is invalid without a follower_id" do
    relationship = Relationship.new(followed_id: followed_user.id, follower_id: nil )
    expect(relationship).to_not be_valid
  end

  it "is invalid without a followed_id" do
    relationship = Relationship.new(followed_id: nil, follower_id: user.id )
    expect(relationship).to_not be_valid
  end
end
