class ItemsController < ApplicationController
  def index
    # @items = Item.order("created_at DESC")
    # @category = Category.order("created_at DESC")
  end
  def new
    @item = Item.new
    # @room = Room.find(params[:room_id])
    # @category = Category.order("created_at DESC")


    # @message = Message.new
    # @room = Room.find(params[:room_id])
    # @messages = @room.messages.includes(:user)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

    # @prototype = Prototype.new(prototype_params)
    # if @prototype.save
    #   redirect_to root_path
    # else
    #   render :new
    # end

  end

  # def show
  # end

  private
  # params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)


  def item_params
    params.require(:item).permit(:productname,
    :pexplanation,
    :category_id,
    :pstatus_id,
    :shippingcharge_id,
    :shippingarea_id,
    :deliverydatedays_id,
    :price).merge(user_id: current_user.id)
    # 引数の大文字小文字でエラーの原因となる。理由を確認
  end

  # def set_noedit
  #   @prototype = Prototype.find(params[:id])
  #   unless user_signed_in? && current_user.id == @prototype.user_id
  #       redirect_to action: :index
  #   end

end
