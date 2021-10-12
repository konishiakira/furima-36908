class Item < ApplicationRecord
  belongs_to :user
  
  has_one_attached :image

  validates :image,presence: true

  # 商品名必須
  validates :productname,presence: true

  # # 商品の説明必須
  validates :pexplanation, presence: true

  # #ジャンルの選択が「--」の時は保存できないようにする、ジャンルが必須
  validates :category_id,
  numericality: { other_than: 1 , message: "can't be blank"},
  presence: true

  # # 商品の状態必須
  validates :pstatus_id,
  numericality: { other_than: 1 , message: "can't be blank"},
  presence: true

  # # 配送料の負担必須
  validates :shippingcharge_id, 
  numericality: { other_than: 1 , message: "can't be blank"},
  presence: true

  # # 配送元の地域必須
  validates :shippingarea_id,
  numericality: { other_than: 1 , message: "can't be blank"},
  presence: true

  # # 配送までの日数必須
  validates :deliverydatedays_id,
  numericality: { other_than: 1 , message: "can't be blank"},
  presence: true

  # # 価格必須、¥300~¥9,999,999、半角のみ入力OK
  validates :price, presence: true
  validates :price,inclusion: {in: 300..9999999 }
  validates :price,format: { with: /\A[0-9]+\z/ }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :pstatus
  belongs_to :shippingcharge
  belongs_to :shippingarea
  belongs_to :deliverydatedays

end
