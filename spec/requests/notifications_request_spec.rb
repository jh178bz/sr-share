require 'rails_helper'

RSpec.describe "Notifications", type: :request do
  let(:user) { create(:user) }

  describe "notification page" do
    context "In case of login user" do
      
      before do
        sign_in user
      end
      it "is responds succesfully" do
        get notifications_path
        expect(response).to have_http_status(200)
        expect(response).to render_template('notifications/index')
      end
    end

    context "In case of not login user" do
      it "is redirect to login page" do
        get notifications_path
        expect(response).to have_http_status(302)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
