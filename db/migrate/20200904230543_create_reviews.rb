class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :image
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.float :rate, null: false

      t.timestamps
    end
  end
end
