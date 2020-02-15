class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  ZIP_CODE_VALID = /\A\d{3}-\d{4}\z/
  PHONE_VALIDATION = /\A\d{10,11}\z/

  validates :zip_code,                   presence: true, format: {with: ZIP_CODE_VALID}
  validates :prefecture,                 presence: true
  validates :city,                       presence: true
  validates :block,                      presence: true

end