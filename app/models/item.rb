class Item < ApplicationRecord
  # validates :name, :image, :description, :category, :condition, :delivery_charge, :delivery_way, :prefecture, :delivery_day, :price, presence: true
  validates :name, length: { minimum: 1, maximum: 40 }
  validates :description, length: { minimum: 1, maximum: 1000 }
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  # belongs_to user, foreign_key: 'user_id'
  # belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
end
