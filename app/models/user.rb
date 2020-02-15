class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        kana = /\A([ァ-ン]|ー)+\z/

        validates :nickname,                presence: true, length: {maximum: 20}
        validates :first_name,              presence: true
        validates :last_name,               presence: true
        validates :first_name_kana,         presence: true, format: { with: kana }
        validates :last_name_kana,          presence: true, format: { with: kana }
        validates :birthday_year_id,        presence: true
        validates :birthday_month_id,       presence: true
        validates :birthday_day_id,         presence: true
        validates :phone_num,               presence: true
        validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
        validates :password,                presence: true, length: {minimum: 7, maximum: 30}
        validates :password_confirmation,   presence: true, length: {minimum: 7, maximum: 30}


has_one :card
has_one :address
has_many :items
has_many :likes
has_many :comments
end