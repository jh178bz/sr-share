class RemoveColumnFromCategoryItems < ActiveRecord::Migration[5.2]
  def change
    remove_reference :category_items, :maker, foreign_key: true
  end
end
