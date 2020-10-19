class Maker < ApplicationRecord
  has_many :maker_items, dependent: :destroy
  has_many :items,through: :maker_items
  accepts_nested_attributes_for :maker_items
end
