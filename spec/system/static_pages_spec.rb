require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
  describe "top page" do
    context "all page" do
      before do
        visit root_path
      end

      it "is base_title only if title not provided" do
        expect(full_title('')).to eq 'SR Share'
        expect(full_title(nil)).to eq 'SR Share'
      end

      it "SR Share is displayed" do
        expect(page).to have_content 'SR Share'
      end
    end
  end

  describe "about page" do
    before do
      visit about_path
    end

    it "about page is displayed correctly" do
      expect(page).to have_content 'SR Shareとは？'
    end

    it "is full_title if title proveded" do
      expect(full_title('SR Shareとは？')).to eq 'SR Shareとは？ - SR Share'
    end
  end
end
