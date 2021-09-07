class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: :edit
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :item_info, :item_category_id, :item_prefecture_id, :item_sales_status_id,
                                 :item_shipping_fee_status_id, :item_scheduled_delivery_id, :item_price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless Item.find(params[:id]).user.id.to_i == current_user.id
  end
end
