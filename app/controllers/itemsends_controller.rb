class ItemsendsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :create,:edit]
  before_action :p_id_find
  before_action :set_souldout
  before_action :my_item_check

  def new
    p_id_find
    @item = BuylogItemsend.new
  end
  def create 
    p_id_find
    @price = @items.price
    @item = BuylogItemsend.new(item_params)
    if @item.valid?
      pay_item
      @item.save      
      redirect_to root_path
    else
        render :new
    end
  end

  private

  def item_params
    params.require(:buylog_itemsend).permit(:cdata,:exp_month,:exp_year,:cvc,:postalcode,
    :prefecture_id,
    :city,:cityaddress,
    :buildingname,
    :sendtel).merge(item_id: params[:item_id],user_id: current_user.id,token: params[:token])
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
        @items = Item.all.order("created_at DESC")
        render "items/index"
    end
  end

  def my_item_check

    if current_user.id == p_id_find[:user_id]
        @items = Item.all.order("created_at DESC")
        render "items/index"
    end
  end

  def p_id_find
    @items = Item.find(params[:item_id])
  end  
end
