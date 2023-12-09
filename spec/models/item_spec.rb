require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品出品機能" do
    context "出品出来る" do
      it "全ての情報が入力されていれば出品出来る" do
        expect(@item).to be_valid
      end
    end
    context "出品出来ない" do
      it "商品画像が空だと出品出来ない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空だと出品出来ない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "商品の説明が空だと出品出来ない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーidが1だと出品出来ない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態idが1だと出品出来ない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "配送料の負担idが1だと出品出来ない" do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it "発送元の地域idが1だと出品出来ない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送までの日数idが1だと出品出来ない" do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end
      it "販売価格が空だと出品出来ない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が300未満だと出品出来ない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "販売価格が10000000以上だと出品出来ない" do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "販売価格が全角数字だと出品出来ない" do
        @item.price = "１００００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "販売価格が半角英字だと出品出来ない" do
        @item.price = "aaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "販売価格が半角英数字混合だと出品出来ない" do
        @item.price = "a1000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "ユーザーが紐付いていないと出品出来ない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end