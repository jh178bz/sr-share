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

    it "can create tire category" do
      expect { post categories_path, params: { category: category_params }}.to change(Category, :count).by(1)
    end
  end
end
