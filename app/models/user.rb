class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # <deviseデフォルトバリデーション>
  # メールアドレスが必須であること。(デフォルト)
  # メールアドレスが一意性であること。（デフォルト）
  # パスワードが必須であること。（デフォルト）


  validates :nickname, presence: true
  # ニックネームが必須であること。OK

  validates :password,
            length: { minimum: 6 },
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i },
            confirmation: true
  validates :password_confirmation, presence: true
  # パスワードは、6文字以上での入力が必須であること OK
  # パスワードは、半角英数字混合での入力が必須であること OK
  # パスワードとパスワード（確認）は、値の一致が必須であること。 OK

  validates :f_name, presence: true,
            format: { with: /\A[ぁ-んァ-ン一-龥]/}
  # お名前(全角)は、名字と名前がそれぞれ必須であること。OK
  # お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。OK

  validates :l_name, presence: true,
            format: { with: /\A[ぁ-んァ-ン一-龥]/}
  # お名前(全角)は、名字と名前がそれぞれ必須であること。OK
  # お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。OK

  validates :f_name_f, presence: true,
            format: { with: /\A[ァ-ヶー－]+\z/}
  # お名前カナ(全角)は、名字と名前がそれぞれ必須であること。OK
  # お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。OK

  validates :l_name_f, presence: true,  
            format: { with: /\A[ァ-ヶー－]+\z/}
  # お名前カナ(全角)は、名字と名前がそれぞれ必須であること。OK
  # お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。OK

  validates :birthday, presence: true
  # 生年月日が必須であること。

  # /\A[a-zA-Z0-9]+\z/
  # -------------
  # validates :content, presence: true, unless: :was_attached?
  # unless部分：メソッドの返り値がfalseならば
  # バリデーションによる検証を行う

  # def was_attached?
  #   self.image.attached?
  # レコードにファイルが添付されているかどうかでtrueかfalseを返す
  # -------------

end