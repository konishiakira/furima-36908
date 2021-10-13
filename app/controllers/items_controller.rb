class ItemsController < ApplicationController
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

    # @tweet = Tweet.find(params[:id])
  # @comment = Comment.new
  # @comments = @tweet.comments.includes(:user)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
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
    # 引数の大文字小文字でエラーの原因となる。理由を確認
  end

  # 「比較のために記述」
  # def set_noedit
  #   @prototype = Prototype.find(params[:id])
  #   unless user_signed_in? && current_user.id == @prototype.user_id
  #       redirect_to action: :index
  #   end

end
