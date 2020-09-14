require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "user sign up" do
    let(:user) { create(:user) }
    let(:user_params) { attributes_for(:user) }
    let(:invalid_user_params) { attributes_for(:user, name: "") }

    context 'valid user_params' do
      it "is request succesfully" do
        post user_registration_path, params: { user: user_params }
        expect(response).to have_http_status(302)
      end

      it "is create succesfully" do
        expect { post user_registration_path, params: {user: user_params }}
        .to change(User, :count).by(1)
      end
    end

    context 'invalid user_params' do
      it "is request failure" do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response).to have_http_status(200)
      end

      it "is create failure" do
        expect { post user_registration_path, params: {user: invalid_user_params }}.to change(User, :count).by(0)
      end
    end
  end

  describe "user show page" do
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    it "is responds succesfully" do
      get user_path(user)
      expect(response).to have_http_status(200)
    end
  end

  describe "user follow" do
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

  describe "user index page" do
    let(:user) { create(:user) }

    context "In case of login user" do
      it "is index_page responds succesfully" do
        sign_in user
        get users_path
        expect(response).to have_http_status(200)
        expect(response).to render_template('users/index')
      end
    end

    context "In case of not login user" do
      it "is index_page responds failure" do
        get users_path
        expect(response).to have_http_status(302)
        expect(response).to redirect_to user_session_path
      end
    end
  end
end
