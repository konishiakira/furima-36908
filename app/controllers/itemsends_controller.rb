class ItemsendsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :create,:edit]
  before_action :p_id_find
  before_action :set_souldout
  before_action :my_item_check
  # def index
  # end
  def new
    # binding.pry
    # @items = Item.find(params[:item_id])
    p_id_find
    @item = BuylogItemsend.new
    # @item = Itemsend.new

    # paramsの中身から指定したのはいいが、なんでフォーマットなんだろ？
    #ネスト設定をしていなかった関係上そうなっていたっぽい
  end
  def create 
    # @items = Item.find(params[:item_id])
    p_id_find
    @price = @items.price
    # binding.pry
    
    # pay_item
    @item = BuylogItemsend.new(item_params)
    if @item.valid?
      pay_item
      @item.save      
      redirect_to root_path
    else
      # binding.pry
        render :new
    end
  end
    # @item.save

    # @donation_address = DonationAddress.new(donation_params)
    # if @donation_address.valid?
    #   @donation_address.save
    #   redirect_to root_path
    # else
    #   render :new
    # end
  private

  # .require(:donation_address)

  def item_params
    # binding.pry
    params.require(:buylog_itemsend).permit(:cdata,:exp_month,:exp_year,:cvc,:postalcode,
    :prefecture_id,
    :city,:cityaddress,
    :buildingname,
    :sendtel).merge(item_id: params[:item_id],user_id: current_user.id,token: params[:token])
    # ,price: params[:price]
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_souldout
    if p_id_find.buylog != nil
    # unless user_signed_in? && current_user.id == @item.user_id
        # redirect_to action: :index
        @items = Item.all.order("created_at DESC")
        render "items/index"
    end
  end

  def my_item_check

    if current_user.id == p_id_find[:user_id]
        # redirect_to action: :index
        @items = Item.all.order("created_at DESC")
        render "items/index"
    end
  end

  def p_id_find
    @items = Item.find(params[:item_id])
  end

  # end
  # | postalcode    | string     | null: false                    |
  # | prefecture_id | integer    | null: false                    |
  # | city          | string     | null: false                    |
  # | cityaddress   | string     | null: false                    |
  # | buildingname  | string     |                                |
  # | sendtel       | string     | null: false                    |
  # | buylog        | references | null: false, foreign_key: true |
  # | Column          | Type       | Options                        |
  # | --------------- | ---------- | ------------------------------ |
  # | user            | references | null: false, foreign_key: true |
  # | item            | references | null: false, foreign_key: true |
  
  
  ## itemsends テーブル
  
  # | Column        | Type       | Options                        |
  # | ------------- | ---------- | ------------------------------ |
  # | postalcode    | string     | null: false                    |
  # | prefecture_id | integer    | null: false                    |
  # | city          | string     | null: false                    |
  # | cityaddress   | string     | null: false                    |
  # | buildingname  | string     |                                |
  # | sendtel       | string     | null: false                    |
  # | buylog        | references | null: false, foreign_key: true |

  
end
