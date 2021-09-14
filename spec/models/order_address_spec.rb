require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
      @item.save
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
      sleep(1)
    end

    context '成功する場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '失敗する場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'post_codeが全角のハイフンを含んだ形式では保存できないこと' do
        @order_address.post_code = '123ー4567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'post_codeが全角の数値を含んだ形式では保存できないこと' do
        @order_address.post_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'prefecture_idが空だと保存できないこと' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'home_numが空だと保存できないこと' do
        @order_address.home_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Home num can't be blank")
      end
      it 'telが空だと保存できないこと' do
        @order_address.tel = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telが10桁以下だと保存できないこと' do
        @order_address.tel = '000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが11桁以上だと保存できないこと' do
        @order_address.tel = '000000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'telに全角数値を使用すると保存できないこと' do
        @order_address.tel = '００００００００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'telに半角数値意外を使用すると保存できないこと' do
        @order_address.tel = '000-0000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
