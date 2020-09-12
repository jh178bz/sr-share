require 'rails_helper'

RSpec.describe Notification, type: :model do
  let!(:notification) { create(:notification) }

  it "is valid with visiter_id, visited_id, action" do
    expect(notification).to be_valid
  end

  it "is invalid without visiter_id" do
    notification.visiter_id = nil
    expect(notification).not_to be_valid
  end

  it "is invalid without visited_id" do
    notification.visited_id = nil
    expect(notification).not_to be_valid
  end

  it "is invalid without action" do
    notification.action = nil
    expect(notification).not_to be_valid
  end
end
