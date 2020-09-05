require 'rails_helper'

RSpec.describe "Reviews", type: :system do
  let!(:user) { create(:user) }
  let!(:item) { create(:item) }

  describe "review create page" do
    before do
      sign_in user
      visit new_item_review_path(item.id)
    end

    context "page layout" do
      # 投稿するボタンがあること
      it "is displayed create button" do
        expect(page).to have_button '投稿する'
      end
      # 適切なラベル
      it "label is correctly displayed " do
        expect(page).to have_content 'レビュータイトル'
        expect(page).to have_content '評価'
        expect(page).to have_content 'レビューを記入する'
        expect(page).to have_content '画像を添付する'
      end
      # タイトル表示
      it "title is correctly" do
        expect(page).to have_title full_title('レビュー投稿')
      end
    end

    context "review create process" do
      it "is valid create" do
        fill_in "レビュータイトル", with: "レビューテストタイトル"
        find('#review_rate', visible: false).set(4)
        fill_in "レビューを記入する", with: "テストレビュー"
        click_button "投稿する"
        expect(page).to have_content 'レビューを投稿しました'
      end

      it "is invalid create" do
        fill_in "レビュータイトル", with: ""
        find('#review_rate', visible: false).set(4)
        fill_in "レビューを記入する", with: ""
        click_button "投稿する"
        expect(page).to have_content '投稿に失敗しました'
      end
    end
  end
end
