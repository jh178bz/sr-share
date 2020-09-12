require 'rails_helper'

RSpec.describe "Items", type: :request do
  let!(:user) { create(:user) }
  let!(:admin) { create(:user, name: "管理ユーザー", email: "admin@example.com", admin: true) }
  let(:item) { create(:item) }
  let(:item_params) { attributes_for(:item) }

  describe "In case of admin user" do
    before do
      sign_in admin
    end
    # showpage正常レスポンス
    it "is show_page responds succesfully" do
      get item_path(item)
      expect(response).to have_http_status(200)
    end
    # newpage正常レスポンス
    it "is new_page responds succesfully" do
      get new_item_path
      expect(response).to have_http_status(200)
    end
    # 商品作成ができる
    it "can create tire item" do
      expect { post items_path, params: { item: item_params }}.to change(Item, :count).by(1)
    end
    # 商品削除ができる
    it "can destroy tire item" do
      item1 = FactoryBot.create(:item)
      expect { delete item_path(item1) }.to change(Item, :count).by(-1)
    end
  end

  describe "In case of normal user" do
    before do
      sign_in user
    end

    context "item show page" do
      # showpage正常レスポンス
      it "is show_page responds succesfully" do
        get item_path(item)
        expect(response).to have_http_status(200)
      end
      # newpageはアクセス出来ずroot_pathへ
      it "is new_page responds failure" do
        get new_item_path
        expect(response).to have_http_status(302)
        expect(response).to redirect_to root_path
      end
      # 商品作成ができ無い
      it "can not create tire item" do
        expect { post items_path, params: { item: item_params }}.to change(Item, :count).by(0)
      end
      # 商品削除ができ無い
      it "can not destroy tire item" do
        item1 = FactoryBot.create(:item)
        expect { delete item_path(item1) }.to change(Item, :count).by(0)
      end
    end

    context "item index page" do
      it "is index_page responds succesfully" do
        get items_path
        expect(response).to have_http_status(200)
        expect(response).to render_template('items/index')
      end
    end
  end

  describe "In case of not login user" do
    # showpageはアクセス出来ずログインページへ
    it "is show_page responds failure" do
      get item_path(item)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to user_session_path
    end

    it "is index_page responds failure" do
      get items_path
      expect(response).to have_http_status(302)
      expect(response).to redirect_to user_session_path
    end
  end
end
