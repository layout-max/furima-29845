require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品' do
      context '商品出品がうまくいくとき' do
        it "必須項目が全て埋まっていれば出品できること" do
          expect(@item).to be_valid
        end

        it "価格が300~9999999の範囲であれば出品できること" do
          @item.price = 500
          expect(@item).to be_valid
        end

        it "販売価格が半角数字のみであれば出品できること" do
          @item.price = 1000
          expect(@item).to be_valid
        end
      end


      context '商品出品がうまくいかないとき' do
        it "画像が存在しないとき" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("画像を入力してください")
        end
        
        it "商品名が入力されていないとき" do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("商品名を入力してください")
        end
        
        it "商品の説明が入力されていないとき" do
          @item.info = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("商品の説明を入力してください")
        end

        it "カテゴリーの情報がないとき" do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("カテゴリーは--以外の値にしてください。")
        end

        it "商品の状態の情報がないとき" do
          @item.condition_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("商品の状態は--以外の値にしてください。")
        end

        it "配送料の負担についての情報がないとき" do
          @item.send_cost_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("配送料の負担は--以外の値にしてください。")
        end

        it "配送元の地域についての情報がないとき" do
          @item.area_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("配送元の地域は--以外の値にしてください。")
        end

        it "配送までの日数についての情報がないとき" do
          @item.delivery_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("発送までの日数は--以外の値にしてください。")
        end

        it "価格についての情報がないとき" do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("価格を入力してください")
        end

        it "価格が299円以下であるとき" do
          @item.price = 100
          @item.valid?
          expect(@item.errors.full_messages).to include("価格は一覧にありません")
        end

        it "価格が10000000円以上であるとき" do
          @item.price = 100000000
          @item.valid?
          expect(@item.errors.full_messages).to include("価格は一覧にありません")
        end

        it "販売価格に全角数字が入っているとき" do
          @item.price = "５00"
          @item.valid?
          expect(@item.errors.full_messages).to include("価格は一覧にありません")
        end

        it "販売価格に数字以外が入っているとき" do
          @item.price = "a500"
          @item.valid?
          expect(@item.errors.full_messages).to include("価格は一覧にありません")
        end
      end  
    end
  end
end