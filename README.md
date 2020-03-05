# フリーマーケットアプリケーション
  サイト上で商品の出品、購入が出来ます。
<br>

<img style="width=80% text-aline: center;" alt="TOP画像" src="https://user-images.githubusercontent.com/55340851/75955272-de23a600-5ef8-11ea-8622-18152764fc57.png">

## 接続方法
- URL : http://18.177.242.24/
- ID/Pass
  -ID: admin
  - Pass: 2222
- テスト用アカウント等
  - 購入者用
    - メールアドレス: hoge@ho.gee
    - パスワード: rrrr4444
  - 購入用カード情報
    - 番号：4242424242424242
    - 期限：4/2024
    - セキュリティコード：1111
  - 出品者用
    - メールアドレス名: testtest@gmail.com
    - パスワード: aaaa1111


## 使用技術
- Ruby 2.5.1  
- Rails 5.2.4  
- Haml/Scss   
- JQuary  
- GitHub, Git  
- Rspec  
- MySQL 5.6  
- AWS 
  - EC2  
  - S3  
  - Capstrano  
- Nginx, Unicorn  


## 💬 Usage
https://github.com/yui0308ks/freemarket_sample_68g

# ER図
￼￼<img style="width=80%; text-aline= center;" alt="ER図" src="https://user-images.githubusercontent.com/55340851/75954998-5c337d00-5ef8-11ea-9574-9e83ef01b2a1.png)
">


# DB設計
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
|content|text|
|email_address|string|null: false|
|password|string|null: false|
|image|text|null: false|
### Association
- has_one :card
- has_one :address
- has_many :items
- has_many :likes
- has_many :comments


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|name|string|null: false|
|description|text|null: false|
|category|references|null: false, foreign_key: true|
|condition|enum| null: false|
|size|integer|null: false|
|delivery_charge|enum|null: false|
|delivery_way|enum|null: false|
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
|comment|text|null: false|
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
### Association
- belongs_to :user


## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|zip_code|string|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
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
