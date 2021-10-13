class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :create,:edit]
  before_action :set_noedit, only: [:edit,:destroy]
  # ログインしていなかったらリダイレクトでトップページに戻るよ！
  # というのを、showアクションに反映させる
  #購入機能追加時に追加
  before_action :item_update,only: [:edit,:update]

  # 「比較のために記述」。下記はdeviseを用いない場合の記述。対象メソッドも同様にコメントアウト
  # before_action :move_to_index, only: [:show]

  def index
    @items = Item.all.order("created_at DESC")

  end
  def new
    @item = Item.new

    # 「比較のために記述」
    # @message = Message.new
    # @room = Room.find(params[:room_id])
    # @messages = @room.messages.includes(:user)
  end

  def show
    @items = Item.find(params[:id])
    # 「比較のために記述」    
    # @tweet = Tweet.find(params[:id])
    # @comment = Comment.new
    # @comments = @tweet.comments.includes(:user)
  end

  def edit
    # @item = Item.find(params[:id])
    item_paramsid
  end

  def update
    # @item = Item.find(params[:id])
    item_paramsid
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end
  private

  def item_params
    params.require(:item).permit(:productname,
    :pexplanation,
    :category_id,
    :pstatus_id,
    :shippingcharge_id,
    :shippingarea_id,
    :deliverydatedays_id,
    :price,
    :image).merge(user_id: current_user.id)
  end

  # 「比較のために記述」
  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end

  def set_noedit
    item_paramsid
    unless user_signed_in? && current_user.id == @item.user_id
        redirect_to action: :index
    end
  end

  def item_paramsid
    @item = Item.find(params[:id])    
  end
end
