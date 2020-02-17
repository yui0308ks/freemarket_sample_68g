class Address < ApplicationRecord

  belongs_to :user

  ZIP_CODE_VALID = /\A\d{3}-\d{4}\z/
  PHONE_VALIDATION = /\A\d{10,11}\z/

  validates :zip_code,                   presence: true, format: {with: ZIP_CODE_VALID}
  validates :prefecture_id,                 presence: true
  validates :city,                       presence: true
  validates :block,                      presence: true

end