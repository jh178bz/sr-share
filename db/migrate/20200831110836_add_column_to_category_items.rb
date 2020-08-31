class AddColumnToCategoryItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :category_items, :maker, index: true, foreign_key: true
  end
end
