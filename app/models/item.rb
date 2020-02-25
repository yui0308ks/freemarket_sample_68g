class Item < ApplicationRecord
  # validates :name, :image, :description, :category, :condition, :delivery_charge, :delivery_way, :prefecture, :delivery_day, :price, presence: true
  # validates :name, length: { minimum: 1, maximum: 40 }
  # validates :description, length: { minimum: 1, maximum: 1000 }

  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  has_many :images, dependent: :destroy
  has_many :comments
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to user #, foreign_key: 'user_id'
  # belongs_to :category



# headerの検索機能
  scope :search, -> (search_params) do
    # search_paramsが空の場合以降の処理を行わない。
    # >> {}.blank?
    # => true
    return if search_params.blank?
    # パラメータを指定して検索を実行する
    name_like(search_params[:name])
      # .gender_is(search_params[:gender]) 他に何かあれば追加
      # .birthday_from(search_params[:birthday_from]) 他に何かあれば追加
  end
  # nameが存在する場合、nameをlike検索する
  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }



  enum condition: {
  "選択してください":0,新品:1,中古:2
  }
  
  enum delivery_charge: {
  "---":0,送料込み（出品者負担）:1,着払い（購入者負担）:2
  }

  enum prefecture:{
  "---":0,
  北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
  茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
  新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
  岐阜県:21,静岡県:22,愛知県:23,三重県:24,
  滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
  鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
  徳島県:36,香川県:37,愛媛県:38,高知県:39,
  福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  },_prefix: true

  enum delivery_day:{
  "---":0,
  "1~2日で発送":1, "2~3日で発送":2, "4~7日で発送":3
},_prefix: true
end
