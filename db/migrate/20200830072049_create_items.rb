class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :image
      t.text :content

      t.timestamps
    end
    change_table :items, bulk: true do |t|
      t.index :name, unique: true
    end
  end
end
