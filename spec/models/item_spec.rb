require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it '全ての項目が入力されれば出品できる' do
        expect(@item).to be_valid
      end
      it 'item_priceが300円なら出品できる' do
        @item.item_price = 300
        expect(@item).to be_valid
      end
      it 'item_priceが9,999,999円なら出品できる' do
        @item.item_price = 9_999_999
        expect(@item).to be_valid
      end
      it 'item_priceが半角なら出品できる' do
        @item.item_price = 300
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageがないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameがないと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_infoがないと出品できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it 'item_category_idがないと出品できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'item_sales_status_idがないと出品できない' do
        @item.item_sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status can't be blank")
      end
      it 'item_shipping_fee_idがないと出品できない' do
        @item.item_shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
      end
      it 'item_prefecture_idがないと出品できない' do
        @item.item_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
      end
      it 'item_scheduled_delivery_idがないと出品できない' do
        @item.item_scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end
      it 'item_priceがないと出品できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'item_priceが300円以下だと出品できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is out of setting range')
      end
      it 'item_priceが9,999,999円以上だと出品できない' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is out of setting range')
      end
      it 'item_priceが半角数字でないと出品できない' do
        @item.item_price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is invalid. Input half-width characters')
      end
      it 'item_priceが半角英数混合では登録できないこと' do
        @item.item_price = '300dollars'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is invalid. Input half-width characters')
      end
      it 'item_priceが半角英語だけでは登録できないこと' do
        @item.item_price = 'threemillion'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is invalid. Input half-width characters')
      end
    end
  end
end
