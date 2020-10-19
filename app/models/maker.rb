class Maker < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
  validates :id, presence: true
  has_many :maker_items, dependent: :destroy
  has_many :items,through: :maker_items
  accepts_nested_attributes_for :maker_items
  mount_uploader :image, ImageUploader
end
