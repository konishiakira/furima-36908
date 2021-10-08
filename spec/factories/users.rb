FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    f_name {"あア亜"}
    l_name {"いイ伊"}
    f_name_f {"アアアアア"}
    l_name_f {"イイイイイ"}
    birthday {Faker::Date.birthday}
    email {Faker::Internet.free_email}
    password {'123abc'}
    password_confirmation {password}
  end
end

# 新規登録/ユーザー情報
# ニックネームが必須であること。OK
# メールアドレスが必須であること。OK
# メールアドレスが一意性であること。OK
# メールアドレスは、@を含む必要があること。
# パスワードが必須であること。OK
# パスワードは、6文字以上での入力が必須であることOK
# パスワードは、半角英数字混合での入力が必須であることOK
# パスワードとパスワード（確認）は、値の一致が必須であること。OK
# 新規登録/本人情報確認
# お名前(全角)は、名字と名前がそれぞれ必須であること。OK
# お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。OK
# お名前カナ(全角)は、名字と名前がそれぞれ必須であること。OK
# お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。OK
# 生年月日が必須であること。OK