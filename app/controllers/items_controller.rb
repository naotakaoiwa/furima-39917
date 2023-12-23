class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_set, only: [:show, :edit, :update]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    return unless @item.user_id != current_user.id || @item.order.present?

    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy if item.user_id == current_user.id
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :shipping_id, :prefecture_id,
                                 :delivery_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def item_set
    @item = Item.find(params[:id])
  end
end
