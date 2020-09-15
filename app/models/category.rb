class Category < ApplicationRecord
  has_many :category_items, dependent: :destroy
  has_many :items, through: :category_items
  accepts_nested_attributes_for :category_items
  mount_uploader :image, ImageUploader
end
