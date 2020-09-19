require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "home_page" do
    it "responds succesfully" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

  describe "about_page" do
    it "responds succesfully" do
      get about_path
      expect(response).to have_http_status(200)
    end
  end
end
