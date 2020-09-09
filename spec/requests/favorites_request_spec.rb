require 'rails_helper'

RSpec.describe "Favorites", type: :request do
  let(:user) { create(:user) }
  let(:item) { create(:item) }

  describe "favorite create process" do
    context "In case of not login" do
      it "can not create favorite" do
        expect {
          post "/favorites/#{item.id}/create"
        }.not_to change(Favorite, :count)
        expect(response).to redirect_to new_user_session_path
      end

      it "can not destroy favorite" do
        expect {
          delete "/favorites/#{item.id}/delete"
        }.not_to change(Favorite, :count)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
