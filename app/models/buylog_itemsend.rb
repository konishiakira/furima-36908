class BuylogItemsend
  include ActiveModel::Model
  attr_accessor :cdata,:exp_month,:exp_year,:cvc,:token,:price,
  :postalcode,
  :prefecture_id,
  :city,
  :cityaddress,
  :building_name,
  :buildingname,
  :sendtel,
  :buylog_id,
  :item_id,
  :user_id

  # | postalcode    | string     | null: false                    |
  # | prefecture_id | integer    | null: false                    |
  # | city          | string     | null: false                    |
  # | cityaddress   | string     | null: false                    |
  # | buildingname  | string     |                                |
  # | sendtel       | string     | null: false                    |
  # | buylog        | references | null: false, foreign_key: true |
#   配送先の住所情報も購入の都度入力させること。
# 郵便番号が必須であること。
# 郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと（良い例：123-4567　良くない例：1234567）。
# 都道府県が必須であること。
# 市区町村が必須であること。
# 番地が必須であること。
# 建物名は任意であること。
# 電話番号が必須であること。
# 電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと（良い例：09012345678　良くない例：090-1234-5678）。

  with_options presence: true do
    validates :postalcode,format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :cityaddress
    validates :sendtel,format: { with: /\A\d{10,11}\z/ }
    # validates :buylog_id
    # validates :price
    validates :token
  end
    # validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: 'is invalid'}
    # validates :user_id
    # validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  # validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}


  # binding.pry
  def save
    # 寄付情報を保存し、変数donationに代入する
    buylog = Buylog.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Itemsend.create(postalcode: postalcode, prefecture_id: prefecture_id, city: city, cityaddress: cityaddress, buildingname: buildingname, sendtel: sendtel, buylog_id: buylog.id)
  end
  # def save
  # end
end
  # | postalcode    | string     | null: false                    |
  # | prefecture_id | integer    | null: false                    |
  # | city          | string     | null: false                    |
  # | cityaddress   | string     | null: false                    |
  # | buildingname  | string     |                                |
  # | sendtel       | string     | null: false                    |
  # | buylog        | references | null: false, foreign_key: true |