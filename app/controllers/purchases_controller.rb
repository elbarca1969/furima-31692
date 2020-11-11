class PurchasesController < ApplicationController
  
  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: purchase_params[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

end