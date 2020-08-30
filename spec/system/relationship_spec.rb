require 'rails_helper'

RSpec.describe "Relationships", type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user, name: "ユーザー２", email: "testuser@example.com") }

  describe "user follow page" do
    it "user following followers default count 0" do
      expect(user.following.count).to eq 0
      expect(user.followers.count).to eq 0
    end

    context "user follow process" do
      before do
        sign_in user
        visit user_path(other_user)
        click_button 'フォロー'
      end

      it "followers count is changed when user following a other_user" do
        expect(user.following.count).to eq 1
        expect(user.followers.count).to eq 0
        expect(other_user.followers.count).to eq 1
        expect(other_user.following.count).to eq 0
      end

      it "followers count is changed when user unfollow a other_user" do
        click_button 'フォロー中'
        expect(user.following.count).to eq 0
        expect(other_user.followers.count).to eq 0
      end
    end
  end
end
