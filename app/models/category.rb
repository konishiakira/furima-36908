class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },   # ←こちらに注目しましょう
    { id: 2, name: 'メンズ' },
    { id: 3, name: 'レディース' },
    { id: 4, name: 'ベビー・キッズ' },
    { id: 5, name: 'インテリア・住まい・小物' },
    { id: 6, name: '本・音楽・ゲーム' },
    { id: 7, name: 'おもちゃ・ホビー・グッズ' },
    { id: 8, name: '家電・スマホ・カメラ' },
    { id: 9, name: 'スポーツ・レジャー' },
    { id: 10, name: 'ハンドメイド' },
    { id: 11, name: 'その他' }
  ]


   include ActiveHash::Associations
   has_many :items
  # belongs_to :item

  # #空の投稿を保存できないようにする
  # validates :title, :text, presence: true

  # #ジャンルの選択が「--」の時は保存できないようにする
  # validates :item_id, numericality: { other_than: 1 } 

  # #ジャンルの選択が「--」の時は保存できないようにする
  # validates :item_id, numericality: { other_than: 1 , message: "can't be blank"}

end
