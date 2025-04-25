require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の保存' do
    context '配送先情報が保存できるとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_shipping_address).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @order_shipping_address.building_name = ''
        expect(@order_shipping_address).to be_valid
      end
    end

    context '配送先情報が保存できないとき' do
      it 'postal_codeが空だと保存できない' do
        @order_shipping_address.postal_code = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_shipping_address.postal_code = '1200000'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Postal code は「123-4567」の形式で入力してください')
      end
      it 'prefecture_idが空だと保存できない' do
        @order_shipping_address.prefecture_id = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idは半角数字でないと保存できない' do
        @order_shipping_address.prefecture_id = '２'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Prefecture is not a number')
      end
      it 'prefecture_idが1だと保存できない' do
        @order_shipping_address.prefecture_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空だと保存できない' do
        @order_shipping_address.city = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できない' do
        @order_shipping_address.address = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @order_shipping_address.phone_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberはハイフンがあると保存できない' do
        @order_shipping_address.phone_number = '090-1234-5678'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Phone number はハイフンなしの10〜11桁で入力してください')
      end
      it 'phone_numberは9桁だと保存できない' do
        @order_shipping_address.phone_number = '090000000'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Phone number はハイフンなしの10〜11桁で入力してください')
      end
      it 'phone_numberは12桁だと保存できない' do
        @order_shipping_address.phone_number = '090000000000'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Phone number はハイフンなしの10〜11桁で入力してください')
      end
      it 'tokenが空では保存できない' do
        @order_shipping_address.token = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では保存できない' do
        @order_shipping_address.user_id = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では保存できない' do
        @order_shipping_address.item_id = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
