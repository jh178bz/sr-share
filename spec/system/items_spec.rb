require 'rails_helper'

RSpec.describe "Items", type: :system do
  let!(:admin) { create(:user, name: "管理ユーザー", email: "admin@example.com", admin: true) }

  before do
    sign_in admin
    visit new_item_path
  end

  describe "tire item create page" do
    context "page layout" do
      # タイヤ作成のボタンがあること
      it "is displayed create button" do
        expect(page).to have_button 'タイヤ作成'
      end
      # タイトル表示
      it "title is correctly" do
        expect(page).to have_title full_title('タイヤ登録')
      end
      # 適切なラベル
      it "label is correctly displayed " do
        expect(page).to have_content 'タイヤ名'
        expect(page).to have_content 'タイヤ詳細説明'
        expect(page).to have_content '画像'
        expect(page).to have_content 'カテゴリ'
      end
    end

    context "tire item create process" do
      it "item valid create" do
        fill_in "タイヤ名", with: "テストアイテム"
        fill_in "タイヤ詳細説明", with: "テスト説明"
        click_button "タイヤ作成"
        expect(page).to have_content "作成しました"
      end

      it "item invalid create" do
        fill_in "タイヤ名", with: ""
        fill_in "タイヤ詳細説明", with: ""
        click_button "タイヤ作成"
        expect(page).to have_content "作成に失敗しました"
      end
    end
  end
end
