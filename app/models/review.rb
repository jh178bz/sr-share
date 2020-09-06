class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :title,   presence: true
  validates :content, presence: true, length: { maximum: 200 }
  validates :rate,    presence: true
  mount_uploader :image, ImageUploader
end
