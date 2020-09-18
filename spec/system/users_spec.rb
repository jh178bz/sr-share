require 'rails_helper'

RSpec.describe "Users", type: :system do
  let!(:user) { create(:user) }
  let!(:item) { create(:item) }
  let!(:other_item) { create(:item, name: 'タイヤ２', content: 'タイヤ２のコンテント') }
  let(:review) { create(:review, user: user, user_id: user.id) }

  describe "user signup page" do
    context "user signup process" do
      before do
        visit new_user_registration_path
      end
      it "user valid signup" do
        fill_in "ユーザー名", with: "hogehoge"
        fill_in "メールアドレス", with: "hoge@example.com"
        fill_in "パスワード(6文字以上)", with: "password"
        fill_in "パスワード(確認用)", with: "password"
        click_on "新規登録"
        expect(page).to have_current_path(users_path)
      end

      it "user invalid signup" do
        fill_in "ユーザー名", with: ""
        fill_in "メールアドレス", with: ""
        fill_in "パスワード(6文字以上)", with: "password"
        fill_in "パスワード(確認用)", with: "pass"
        click_on "新規登録"
        expect(page).to have_content "Nameを入力してください"
        expect(page).to have_content "Emailを入力してください"
        expect(page).to have_content "Password confirmationとPasswordの入力が一致しません"
      end
    end
  end

  describe "user detail page" do
    before do
      sign_in user
      visit user_path(user)
    end

    context "page content is correctly" do
      it "title is correctly displayed" do
        expect(full_title('マイページ')).to eq "マイページ - SR Share"
      end

      it "is displayed item review count" do
        expect(page).to have_content user.reviews.count
      end

      it "is displayed user review" do
        expect(page).to have_content user.reviews.first
      end
    end

    context "user favorite item" do
      it "is displayed favorite item" do
        expect(user.favorites.count).to eq(0)
        user.favorite(item)
        user.favorite(other_item)
        expect(user.favorites.count).to eq(2)
        visit user_path(user)
        click_on 'お気に入り'
        expect(page).to have_content '2 お気に入り'
        expect(page).to have_content item.name
        expect(page).to have_content other_item.name
        user.unfavorite(other_item)
        visit user_path(user)
        click_on 'お気に入り'
        expect(page).to have_content '1 お気に入り'
        expect(page).to have_no_content other_item.name
      end
    end
  end

  describe "user index page" do
    let!(:user) { create(:user) }
    let!(:other_user) { create(:user, name: "テスト花子", email: "hanako@example.com") }
    let!(:other_user2) { create(:user, name: "テスト太郎", email: "taro@example.com") }

    before do
      sign_in user
      visit users_path
    end

    context "seach function" do
      it "is displayed search form" do
        expect(page).to have_css '.form-group'
        expect(page).to have_button '検索'
      end

      it "is displayed users including seach content" do
        expect(page).to have_content other_user.name
        expect(page).to have_content other_user2.name
        fill_in 'q[name_cont]', with: '花子'
        click_button '検索'
        expect(page).to have_content other_user.name
        expect(page).not_to have_content other_user2.name
      end
    end
  end
end
