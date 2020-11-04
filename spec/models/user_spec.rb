require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context 'ユーザー新規登録がうまくいくとき' do
        it "全ての項目が存在すれば登録できること" do
          expect(@user).to be_valid
        end
        it "passwordとpassword_confirmationが6文字以上で英数混同であること" do
          @user.password = "111aaa"
          @user.password_confirmation = "111aaa"
          expect(@user).to be_valid
        end
      end

      context 'ユーザー新規登録がうまくいかないとき' do
        it "nicknameが空では登録できない" do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "emailが空では登録できない" do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "重複したemailが存在する場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it "emailに@が含まれていないと登録できない" do
          @user.email = "test"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it "passwordが空では登録できない" do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "passwordが5文字以下であれば登録できない" do
          @user.password = "111aa"
          @user.password_confirmation = "111aa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it "passwordが数字だけでは登録できない" do
          @user.password = "111111"
          @user.password_confirmation = "111111"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it "passwordが英語だけでは登録できない" do
          @user.password = "aaaaaa"
          @user.password_confirmation = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it "passwordが存在してもpassword_confirmationが空では登録できない" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "passwordとpassword_confirmationが一致していないと登録できない" do
          @user.password = "123abc"
          @user.password_confirmation = "456def"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "last_nameが空では登録できなこと" do
          @user.last_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it "first_nameが空では登録できなこと" do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it "last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
          @user.last_name = "yamada"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid")
        end
        it "first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
          @user.first_name = "taro"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end
        it "last_name_kanaが空では登録できなこと" do
          @user.last_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
        it "first_name_kanaが空では登録できなこと" do
          @user.first_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it "last_name_kanaが全角（カタカナ）でないと登録できない" do
          @user.last_name_kana = "山田"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is invalid")
        end
        it "first_name_kanaが全角（カタカナ）でないと登録できない" do
          @user.first_name_kana = "太郎"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
        it "birth_dateが空では登録できなこと" do
          @user.birth_date = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth date can't be blank")
        end
      end
    end
  end
end
