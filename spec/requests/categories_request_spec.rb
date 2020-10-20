require 'rails_helper'

RSpec.describe "Categories", type: :request do
  let!(:admin) { create(:user, name: "管理ユーザー", email: "admin@example.com", admin: true) }
  let(:category) { create(:category) }
  let(:category_params) { attributes_for(:category) }

  describe "In case of admin user" do
    before do
      sign_in admin
    end

    it "is new_page responds succesfully" do
      get new_category_path
      expect(response).to have_http_status(200)
    end
  end

  describe "category index page" do
    let(:user) { create(:user) }

    context "In case of login user" do
      it "is index_page responds succesfully" do
        sign_in user
        get categories_path
        expect(response).to have_http_status(200)
        expect(response).to render_template('categories/index')
      end
    end

    context "In case of not login user" do
      it "is index_page responds failure" do
        get categories_path
        expect(response).to have_http_status(302)
        expect(response).to redirect_to user_session_path
      end
    end
  end
end
