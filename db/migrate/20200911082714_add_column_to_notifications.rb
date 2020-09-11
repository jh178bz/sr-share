class AddColumnToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :checked, :boolean, default: false, null: false
    add_index :notifications, :review_id
  end
end
