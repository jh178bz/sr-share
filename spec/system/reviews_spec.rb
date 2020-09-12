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

  describe "tire item index page" do
    let!(:user) { create(:user)}
    let!(:item1) { create(:item, name: "テストタイヤ1")}
    let!(:item2) { create(:item, name: "テストタイヤ2")}
    let!(:review1) { create(:review, title:"テストタイトル1", item: item1, user: user)}
    let!(:review2) { create(:review, title: "テストタイトル2", item: item2, user: user)}

    before do
      sign_in user
      visit reviews_path
    end

    context "search function" do
      it "is displayed search form" do
        expect(page).to have_css '.form-group'
        expect(page).to have_button '検索'
      end

      it "is displayed reviews including seach content" do
        expect(page).to have_content review1.title
        expect(page).to have_content review2.title
        fill_in 'q[title_or_content_cont]', with: '1'
        click_button '検索'
        expect(page).to have_content review1.title
        expect(page).not_to have_content review2.title
      end
    end
  end
end
