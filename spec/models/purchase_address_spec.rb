require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '#create' do
    before do
      @purchase = FactoryBot.build(:purchase_address)
    end
    it "building_name以外の項目が存在すれば購入できる" do
      expect(@purchase).to be_valid
    end
    it "tokenが空では購入できない" do
      @purchase.token = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Token can't be blank")
    end
    it "postal_codeが空では購入できない" do
      @purchase.postal_code = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
    end
    it "postal_codeにハイフンがなければ購入できない" do
      @purchase.postal_code = 1234567
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal code is invalid")
    end
    it "prefecture_idが１では購入できない" do
      @purchase.prefecture_id = 1
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it "cityが空では購入できない" do
      @purchase.city = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City can't be blank")
    end
    it "house_numberが空では購入できない" do
      @purchase.house_number = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("House number can't be blank")
    end
    it "building_nameが空でも購入できる" do
      @purchase.building_name = nil
      expect(@purchase).to be_valid
    end
    it "phone_numberが空では購入できない" do
      @purchase.phone_number = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
    end
    it "phone_numberにハイフンがあると購入できない" do
      @purchase.phone_number = "090-1234-5678"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is invalid")
    end
    it "user_idが空では購入できない" do
      @purchase.user_id = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("User can't be blank")
    end
    it "item_idが空では購入できない" do
      @purchase.item_id = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Item can't be blank")
    end  
  end
end
