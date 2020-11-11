class PurchasesController < ApplicationController
  
  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

end

private
def purchase_params
  params.permit(:token, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: user_id)
end