class Item < ApplicationRecord
  # validates :name, :image, :description, :category, :condition, :delivery_charge, :delivery_way, :prefecture, :delivery_day, :price, presence: true
  validates :name, length: { minimum: 1, maximum: 40 }
  validates :description, length: { minimum: 1, maximum: 1000 }
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  # belongs_to user, foreign_key: 'user_id'
  # belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

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


end
