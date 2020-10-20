class CreateMakerItems < ActiveRecord::Migration[5.2]
  def change
    create_table :maker_items do |t|
      t.references :item, index: true, foreign_key: true
      t.references :maker, index: true, foreign_key: true

      t.timestamps
    end
  end
end
