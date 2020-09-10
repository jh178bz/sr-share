require 'rails_helper'

RSpec.describe "Favorites", type: :request do
  let!(:user) { create(:user) }
  let!(:item) { create(:item) }

  describe "favorite create process" do
    context "In case of not login" do
      # お気に入り登録出来ない
      it "can not create favorite" do
        expect {
          post "/favorites/#{item.id}/create"
        }.not_to change(Favorite, :count)
        expect(response).to redirect_to new_user_session_path
      end
      # お気に入り解除出来ない
      it "can not destroy favorite" do
        expect {
          delete "/favorites/#{item.id}/destroy"
        }.not_to change(Favorite, :count)
        expect(response).to redirect_to new_user_session_path
      end
      # ログイン画面に戻される
      it "redirect to login page" do
        get favorites_user_path(user)
        expect(response).to have_http_status(302)
        expect(response).to redirect_to new_user_session_path
      end
    end
    context "In case of login" do
      before do
        sign_in user
      end
      # お気に入り登録できる
      it "can create favorite" do
        expect {
          post "/favorites/#{item.id}/create"
        }.to change(user.favorites, :count).by(1)
      end
      # お気に入り解除できる
      it "can destroy favorite" do
        user.favorite(item)
        expect {
          delete "/favorites/#{item.id}/destroy"
        }.to change(user.favorites, :count).by(-1)
      end
      # Ajaxで登録できる
      it "can create favorite when Ajax" do
        expect {
          post "/favorites/#{item.id}/create", xhr: true
        }.to change(user.favorites, :count).by(1)
      end
      # Ajaxで解除できる
      it "can destroy favorite when Ajax" do
        user.favorite(item)
        expect {
          delete "/favorites/#{item.id}/destroy", xhr: true
        }.to change(user.favorites, :count).by(-1)
      end
      # 正常レスポンス
      it "is responds succesfully" do
        get favorites_user_path(user)
        expect(response).to have_http_status(200)
      end
    end
  end
end
