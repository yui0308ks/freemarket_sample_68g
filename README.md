# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday_year_id|integer|null: false|
|birthday_month_id|integer|null: false|
|birthday_day_id|integer|null: false|
|phone_num|string|null: false|
|authentication_num|integer|null: false|
|content|text|
|email_address|string|null: false|
|password|string|null: false|
|image|text|null: false|
### Association
- has_one :image
- has_one :card
- has_one :address
- has_many :images

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|name|string|null: false|
|description|text|null: false|
|category|references|null: false, foreign_key: true|
|condition|enum| null: false|
|size|integer|null: false|
|delivery_charge|references|null: false|
|delivery_way|references|null: false|
|prefecture|references|null: false|

### Association
- belongs_to :user
- belongs_to :category
- has_many :comments
- has_many :likes
- has_many :images


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|refernces|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|string|null: false|
|item_id|string|null: false|
|user_id|string|null: false|
### Association
- belongs_to :item
- belongs_to :user

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|varchar|
### Association
- has_many :items
- has_ancestry


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
|expiration_yyy|integer|null: false|
|expiration_mm|integer|null: false|
|security|integer|null: false|
### Association
- has_many :items
- has_ancestry


## addressテーブル
|Column|Type|Options|
|------|----|-------|
|zip_code1|string|null: false|
|prefecture|integer|null: false|
|city|tring|null: false|
|block|string|null: false|
|home|string|null: false|
### Association
- belongs_to :user


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
