require 'rails_helper'

RSpec.describe "UserSignUp", type: :request do
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
