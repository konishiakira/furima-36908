class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :create,:edit]
  before_action :set_noedit, only: [:edit,:destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def show
    @items = Item.find(params[:id])
  end

  def edit
    item_paramsid
    if @item.buylog != nil
      redirect_to action: :index
    end
  end

  def update
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
