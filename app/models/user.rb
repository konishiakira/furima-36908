class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :f_name, presence: true
  validates :l_name, presence: true
  validates :f_name_f, presence: true
  validates :l_name_f, presence: true
  validates :birthday, presence: true

  # -------------
  # validates :content, presence: true, unless: :was_attached?
  # unless部分：メソッドの返り値がfalseならば
  # バリデーションによる検証を行う

  # def was_attached?
  #   self.image.attached?
  # レコードにファイルが添付されているかどうかでtrueかfalseを返す
  # -------------

end