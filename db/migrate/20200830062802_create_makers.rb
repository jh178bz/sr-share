class CreateMakers < ActiveRecord::Migration[5.2]
  def change
    create_table :makers do |t|
      t.string :name, null: false
      t.string :image

      t.timestamps
    end
    change_table :makers, bulk: true do |t|
      t.index :name, unique: true
    end
  end
end
