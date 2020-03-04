class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :image,                      presence: true
  belongs_to :item, optional: true
end
