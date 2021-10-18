require 'rails_helper'

RSpec.describe BuylogItemsend, type: :model do
  # ここの指定はファイル名ではなく、そのファイルにあるクラス名。「_」がなくなる形になる

  before do
    @order = FactoryBot.build(:buylog_itemsend)
    #用意したテストを参照し、生成するもの「factories内にあるファイルの中のクラス名の指定」
    @buylog = FactoryBot.build(:buylog)
  end
  context '内容に問題ない場合' do
    it "正しく入力されていれば保存ができること" do
      expect(@order).to be_valid
    end
    it "建物名が未入力でも保存ができること" do
    # 建物名は任意であること。
      @order.buildingname = ""
      expect(@order).to be_valid
    end
  end
  # postalcode {"123-4567"}
  # prefecture_id {"石川県"}
  # city {"葛飾区"}
  # cityaddress {"1-23-4"}
  # sendtel {"090-9999-8888"}
  # token {"tok_abcdefghijk00000000000000000"}

  context '内容に問題がある場合' do
    it "郵便番号が空では保存ができないこと" do
    # 郵便番号が必須であること。
      @order.postalcode = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postalcode can't be blank")
    end
    it "都道府県が空では保存ができないこと" do
    # 都道府県が必須であること。
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "都道府県に「---」が選択されている場合は購入できないこと" do
      # 都道府県に「---」以外の選択が必須であること
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

    it "市区町村が空では保存ができないこと" do
      # 市区町村が必須であること。
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it "番地が空では保存ができないこと" do
      # 番地が必須であること。
      @order.cityaddress = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Cityaddress can't be blank")
    end
    it "電話番号が空では保存ができないこと" do
      # 電話番号が必須であること。
      @order.sendtel = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Sendtel can't be blank")
    end
    it "郵便番号は「3桁ハイフン4桁」でないと保存ができないこと" do
      # 郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと
      # （良い例：123-4567　良くない例：1234567）。
      @order.postalcode = "1234567"
      @order.valid?
      expect(@order.errors.full_messages).to include("Postalcode is invalid")
    end

    it "郵便番号が半角ハイフンを含む形でなければ購入できないこと" do
      # ハイフンが半角のみ保存可能であること
      @order.postalcode = "123ー4567"
      @order.valid?
      expect(@order.errors.full_messages).to include("Postalcode is invalid")
    end

    it "電話番号が10桁以上11桁以内でなければ保存ができないこと" do
      # 電話番号は、10桁以上11桁以内のみ保存可能なこと
      # （良い例：09012345678　良くない例：090-1234-5678）。
      @order.sendtel = "090-1234-5678"
      @order.valid?
      expect(@order.errors.full_messages).to include("Sendtel is invalid")
    end
    it "電話番号が半角数値でなければ保存ができないこと" do
      # 電話番号は、半角数値のみ保存可能なこと
      # （良い例：09012345678　良くない例：090-1234-5678）。
      @order.sendtel = "０９０１２３４１２３４"
      @order.valid?
      expect(@order.errors.full_messages).to include("Sendtel is invalid")
    end
    it "電話番号が9桁以下では購入できないこと" do
      # ９桁以下では購入不可であること
      @order.sendtel = "12345678"
      @order.valid?
      expect(@order.errors.full_messages).to include("Sendtel is invalid")
    end
    it "・電話番号が12桁以上では購入できないこと" do
      # 12桁以上では購入不可であること
      @order.sendtel = "1234123412341"
      @order.valid?
      expect(@order.errors.full_messages).to include("Sendtel is invalid")
    end
    it 'ユーザーとの関連キー「user_id」との紐付けがないと保存できないこと' do
      #関連キー「user_id」との紐付けがないと保存できないこと
      @buylog.user = nil
      @buylog.valid?
      expect(@buylog.errors.full_messages).to include("User must exist")
    end
    it '商品との関連キー「item_id」との紐付けがないと保存できないこと' do
      #関連キー「item_id」との紐付けがないと保存できないこと
      @buylog.item = nil
      @buylog.valid?
      expect(@buylog.errors.full_messages).to include("Item must exist")
    end
    it 'tokenが空では購入できないこと' do
      #「token」がないと保存できないこと
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end
end