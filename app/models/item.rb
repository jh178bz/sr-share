class Item < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
  validates :content, presence: true, length: { maximum: 300 }
  validates :category_ids, presence: true
  has_many :category_items, dependent: :destroy
  has_many :categories, through: :category_items
  accepts_nested_attributes_for :category_items
  mount_uploader :image, ImageUploader
end
