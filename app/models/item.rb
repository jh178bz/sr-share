class Item < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
  validates :content, presence: true, length: { maximum: 300 }
  has_many :category_items, dependent: :destroy
  has_many :categories, through: :category_items
  has_many :reviews, dependent: :destroy
  accepts_nested_attributes_for :category_items
  mount_uploader :image, ImageUploader
end
