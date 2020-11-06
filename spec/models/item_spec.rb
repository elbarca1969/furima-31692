require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品' do
      context '商品出品がうまくいくとき' do
        it "全ての項目が存在すれば登録できる" do
          expect(@item).to be_valid
        end
      end

      context '商品出品がうまくいかないとき' do
        it "imageが空では登録できない"do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it "item_nameが空では登録できない" do
          @item.item_name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
        it "contentが空では登録できない" do
          @item.content = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Content can't be blank")
        end
        it "category_idが1では登録できない" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it "condition_idが1では登録できない" do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition must be other than 1")
        end
        it "delivery_fee_idが1では登録できない" do
          @item.delivery_fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
        end
        it "prefecture_idが1では登録できない" do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
        end
        it "ship_day_idが1では登録できない" do
          @item.ship_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Ship day must be other than 1")
        end
        it "priceが空では登録できない" do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it "priceが299円以下では登録できない" do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it "priceが10,000,000以上では登録できない" do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
        it "priceが半角数字でなければ登録できない" do
          @item.price = "３００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it "userが紐づいていないと登録できない" do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end
      end
    end
  end
end
