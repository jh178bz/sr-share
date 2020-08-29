require 'rails_helper'

RSpec.describe "Users", type: :system do
  let!(:user) { create(:user) }

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
        expect(page).to have_current_path(root_path)
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
    context "page content is correctly" do
      before do
        visit user_path(user)
      end

      it "user page have content [マイページ]" do
        pending 'viewの調整を行った時にwithinで絞る'
        expect(page).to have_text "マイページ"
      end

      it "title is correctly displayed" do
        expect(full_title('マイページ')).to eq "マイページ - SR Share"
      end

      it "user infomation is displayed" do
        pending 'viewの調整を行った時にwithinで絞る'
        within '.media-body' do
          expect(page).to have_content user.name
        end
      end
    end
  end
end
