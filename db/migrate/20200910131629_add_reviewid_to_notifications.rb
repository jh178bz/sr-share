class AddReviewidToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :review_id, :integer
  end
end
