class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :content, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :ship_day_id, :price, :image).merge(user_id: current_user.id)
  end

end
