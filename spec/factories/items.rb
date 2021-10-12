FactoryBot.define do
  factory :item do
    productname {"商品名"}
    pexplanation {"あア亜"}
    category_id {2}
    pstatus_id {3}
    shippingcharge_id {2}
    shippingarea_id {3}
    deliverydatedays_id {2}
    price {'500'}

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
# t.references  :user, null: false, foreign_key: true      

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