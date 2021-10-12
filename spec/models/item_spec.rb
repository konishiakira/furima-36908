require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end  
  describe '商品出品機能テスト' do
    context '商品出品ができる場合' do
      it "全ての情報が適切に入力されている場合、商品出品ができる" do
        expect(@item).to be_valid
      end
    end


    context '商品出品ができない場合' do
      # 商品画像を1枚つけることが必須であること。
      it '商品画像が１枚なければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      # 商品名が必須であること。
      it 'productnameが空では登録できない' do
        @item.productname = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Productname can't be blank")
      end

      # 商品の説明が必須であること
      it 'pexplanationが空では登録できない' do
        @item.pexplanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Pexplanation can't be blank")
      end

      # カテゴリーの情報が必須であること
      it 'category_idが1では登録できない' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      # 商品の状態の情報が必須であること
      it 'pstatus_idが1では登録できない' do
        @item.pstatus_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Pstatus can't be blank")
      end

      # 配送料の負担の情報が必須であること
      it 'shippingcharge_idが1では登録できない' do
        @item.shippingcharge_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippingcharge can't be blank")
      end

      # 発送元の地域の情報が必須であること
      it 'shippingarea_idが1では登録できない' do
        @item.shippingarea_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippingarea can't be blank")
      end

      # 発送までの日数の情報が必須であること
      it 'deliverydatedays_idが1では登録できない' do
        @item.deliverydatedays_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliverydatedays can't be blank")
      end

      # 価格の情報が必須であること
      it 'priceが空では登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      # 価格は、¥300~¥9,999,999の間のみ保存可能であること
      it 'priceが¥300~¥9,999,999の間意外では登録できない' do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      # 価格は半角数値のみ保存可能であること
      it 'priceが半角数値意外では登録できない' do
        @item.price = "５０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
# t.string :productname,null: false
# t.text :pexplanation,null: false
# t.integer :category_id,null: false
# t.integer :pstatus_id,null: false
# t.integer :shippingcharge_id,null: false
# t.integer :shippingarea_id,null: false
# t.integer :deliverydatedays_id,null: false
# t.integer :price,null: false

# ・商品画像を1枚つけることが必須であること。モデル側の記述はOK 
# ・商品名が必須であること。OK
# ・ 商品の説明が必須であること。 OK
# ・カテゴリーの情報が必須であること。OK 
# ・商品の状態の情報が必須であること。OK
# ・ 配送料の負担の情報が必須であること。 OK
# ・ 発送元の地域の情報が必須であること。 OK
# ・発送までの日数の情報が必須であること。 OK
# ・ 価格の情報が必須であること。 OK
# ・価格は、¥300~¥9,999,999の間のみ保存可能であること。 OK
# ・価格は半角数値のみ保存可能であること。OK