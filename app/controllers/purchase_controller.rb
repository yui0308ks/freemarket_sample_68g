class PurchaseController < ApplicationController

  require 'payjp'


  # before_action :set_item, only: [:index, :pay, :done]

  def index
    @address = Address.find(current_user.id)
    # @address = Address.where(user_id: current_user).firstでもオッケー！
    card = Card.where(user_id: current_user.id).first
    #テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  # def pay
  #   card = Card.where(user_id: current_user.id).first
  #   Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
  #   Payjp::Charge.create(
  #   :amount => 13500, #支払金額を入力（itemテーブル等に紐づけても良い）
  #   :customer => card.customer_id, #顧客ID
  #   :currency => 'jpy', #日本円
  # )


  def pay
    card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :payjp_test_secret_access_key)
    Payjp::Charge.create(
      :amount => @item.price, #支払金額
      :customer => card.customer_id, #payjpの顧客ID
      :currency => 'jpy', #日本円
    )
    @item.update(customer_id: current_user.id)
    redirect_to action: 'done' #完了画面に移動
  end

  def done
  end

  # private

  # def set_item
  #   @item = Item.find(params[:item_id])
  #   @images = @item.images.order("created_at DESC")
  #   [0,1,2,3,4]
  # end

end
