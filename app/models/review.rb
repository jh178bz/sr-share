class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :title,   presence: true
  validates :content, presence: true, length: { maximum: 200 }
  validates :rate,    presence: true
  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader
end
