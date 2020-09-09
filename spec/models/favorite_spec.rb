require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let!(:favorite) { create(:favorite) }

  it "is valid favorite" do
    expect(favorite).to be_valid
  end

  it "is invalid without user_id" do
    favorite.user_id = nil
    expect(favorite).not_to be_valid
  end

  it "is invalid without item_id" do
    favorite.item_id = nil
    expect(favorite).not_to be_valid
  end
end
