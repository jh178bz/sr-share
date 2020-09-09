require 'rails_helper'

RSpec.describe "Users", type: :system do
  let!(:user) { create(:user) }
  let!(:item) { create(:item) }
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
        sign_in user
        visit user_path(user)
      end

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
  end

  context "favorite" do
    before do
      sign_in user
    end

    it "can favorite create and destroy" do
      expect(user.favorite?(item)).to be_falsey
      user.favorite(item)
      expect(user.favorite?(item)).to be_truthy
      user.unfavorite(item)
      expect(user.favorite?(item)).to be_falsey
    end
  end
end
