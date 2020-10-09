require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    describe "商品購入" do
      context "商品購入が上手くいくとき" do
        it "必要事項が全て記入してあるとき" do
          expect(@order_address).to be_valid
        end

        it "ビル名のみが記載されていないとき" do
          @order_address.building = nil
          expect(@order_address).to be_valid
        end
      end

      context "商品購入が上手くいかないとき" do
        it "カード情報が記載されていないとき" do
          @order_address.token = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end

        it "郵便番号が記載されていないとき" do
          @order_address.postcode = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
        end

        it " 郵便番号にハイフンがないとき" do
          @order_address.postcode = "1234567"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postcode is invalid")
        end

        it "都道府県の番号が１の時" do
          @order_address.area_id = 1
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Area must be other than 1")
        end

        it "市区町村が記載されていないとき" do
          @order_address.cities = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Cities can't be blank")
        end

        it "番地が記載されていないとき" do
          @order_address.number = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Number can't be blank")
        end

        it "電話番号が記載されていないとき" do
          @order_address.telephone = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
        end

        it "電話番号が12桁以上であるとき" do
          @order_address.telephone = "123456789012"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Telephone is too long (maximum is 11 characters)")
        end
      end
    end
  end
end