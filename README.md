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
|nickname|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kane|string|null: false|
|birthday_yyyy_id|integer	null: false|
|birthday_mm_id|integer	null: false|
|birthday_dd_id|integer	null: false|
|phone_num|string	null: false|
|authentication_num|integer	null: false|
|content|text|
|address|references	null: false, foreign_key: true|
|telephone|string|
### Association
- belongs_to_active_hash :birth_yyyy
- belongs_to_active_hash :birth_mm
- belongs_to_active_hash :birth_dd
- belongs_to_active_hash :prefecture
- has_many :products
- has_one :card
- has_one :address

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|name	string|null: false|
|description|text|
|category|references|null: false, foreign_key: true|
|condition|references	null: false, foreign_key: true|
|size	references|null: false, foreign_key: true|
|brand|string|
|delivery_charge|references|null: false, foreign_key: true|
|delivery_way|references|null: false, foreign_key: true|
|prefecture	references|null: false, foreign_key: true|
|delivery_days|references	null: false, foreign_key: true|
|price|integer|null: false|
|status|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :category
- has_many :comments
- has_many :likes


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
|name|string|null: false|
### Association
- has_many :users
- has_many :items


## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|sub|integer|
|sub_sub|integer|
|size|integer|
|brand|integer|
### Association
- has_many :items
- has_ancestry


## cardテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|customer_id|string|
|card_id|string|
### Association
- has_many :items
- has_ancestry

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|zip_code1|string|null: false|
|prefecture_id|integer|null: false|
|city	string|null: false|
|address1|string|
|address2|string|