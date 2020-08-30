require 'rails_helper'

RSpec.describe "UsersFollow", type: :request do
  let(:user) { create(:user) }
  let(:user2) { create(:user, name: "user2", email: "testuser2@example.com") }

  before do
    user.follow(user2)
  end

  context 'users follow page' do
    it "redirect succesfully a follower page" do
      get following_user_path(user)
      expect(response).to have_http_status(302)
    end

    it "redirect succesfully a followed page" do
      get followers_user_path(user)
      expect(response).to have_http_status(302)
    end
  end
end
