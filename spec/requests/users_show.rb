require 'rails_helper'

RSpec.describe "UserPage", type: :request do
  let!(:user) { create(:user) }

  it "is responds succesfully" do
    get user_path(user)
    expect(response).to have_http_status(200)
  end
end
