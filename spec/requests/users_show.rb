require 'rails_helper'

RSpec.describe "UserPage", type: :request do
  let!(:user){ create(:user) }

  it "is responds succesfully" do
    get user_path(user)
    expect(respose).to render_template('users/show') 
  end
end
