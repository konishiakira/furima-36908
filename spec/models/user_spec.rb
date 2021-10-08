require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end  
  describe 'ユーザー新規登録単体テスト' do
    context '新規登録できる場合' do
      it "全ての情報が適切に入力されている場合、新規登録ができる"do
        expect(@user).to be_valid
      end
    end

    # 新規登録/ユーザー情報
    # ニックネームが必須であること。 
    # メールアドレスが必須であること。
    # メールアドレスが一意性であること。* 
    # メールアドレスは、@を含む必要があること。*
    # パスワードが必須であること。 
    # パスワードは、6文字以上での入力が必須であること 
    # パスワードは、半角英数字混合での入力が必須であること 
    # パスワードとパスワード（確認）は、値の一致が必須であること。 
    context '新規登録できない場合' do
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'emailに@がないと登録できない' do
        @user.email = "testabc.ne.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
    end
  end
end
  # | Column             | Type   | Options                  |
  # | ------------------ | ------ | ------------------------ |
  # | email              | string | null: false,unique: true |
  # | encrypted_password | string | null: false              |
  # | nickname           | string | null: false              |
  # | f_name             | string | null: false              |
  # | l_name             | string | null: false              |
  # | f_name_f           | string | null: false              |
  # | l_name_f           | string | null: false              |
  # | birthday           | date   | null: false              |