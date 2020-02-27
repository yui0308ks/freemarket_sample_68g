class Item < ApplicationRecord
  validates :name, :description,  :category_id, :condition, :delivery_charge_id, :prefecture_id, :delivery_day_id, :price, presence: true
  validates :name, length: { minimum: 1, maximum: 40 }
  validates :description, length: { minimum: 1, maximum: 1000 }


  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  # belongs_to :user , foreign_key: 'user_id'

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
    choice:0, news:1, old:2
  },_prefix: true
  
  enum delivery_charge_id: {
    choice:0,include:1,cash_on_delivery:2
  },_prefix: true


  enum delivery_day_id:{
    choice:0,one_day:1, two_day:2, four_day:3
  },_prefix: true
end
