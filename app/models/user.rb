class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

        validates :nickname,                presence: true, length: {maximum: 20},on: :validates_information_first
        validates :first_name,              presence: true, on: :validates_information_first
        validates :last_name,               presence: true, on: :validates_information_first
        validates :first_name_kana,         presence: true, on: :validates_information_first
        validates :last_name_kana,          presence: true, on: :validates_information_first
        validates :birthdate_year_id,       presence: true, on: :validates_information_first
        validates :birthdate_mouth_id,      presence: true, on: :validates_information_first
        validates :birthdate_day_id,        presence: true, on: :validates_information_first
        validates :phone_num,               presence: true, on: :validates_information_first
        validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }, on: :validates_information_second
        validates :password,                presence: true, length: {minimum: 7, maximum: 30}, on: :validates_information_first
        validates :password_confirmation,   presence: true, length: {minimum: 7, maximum: 30}, on: :validates_information_first


- has_one :card
- has_one :address
- has_many :items
- has_many :likes
- has_many :comments
end
