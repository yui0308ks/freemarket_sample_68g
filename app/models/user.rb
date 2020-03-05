class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        kana = /\A([ァ-ン]|ー)+\z/
        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

        VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,30}+\z/i

        validates :nickname,                presence: true, length: {maximum: 20}
        validates :first_name,              presence: true
        validates :last_name,               presence: true
        validates :first_name_kana,         presence: true, format: { with: kana }
        validates :last_name_kana,          presence: true, format: { with: kana }
        validates :birthday_year_id,        numericality: { greater_than: 0 }
        validates :birthday_month_id,       numericality: { greater_than: 0 }
        validates :birthday_day_id,         numericality: { greater_than: 0 }
        validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

        validates :password,                presence: true, format: { with: VALID_PASSWORD_REGEX , message: 'は英字と数字両方を含むパスワードを設定してください'}

        
        
has_one :card
has_one :address
has_many :items
has_many :likes
has_many :comments, dependent: :destroy
end