require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context 'ユーザー新規登録がうまくいくとき' do
        it "全ての項目が存在すれば登録できること" do
          
        end
        it "passwordとpassword_confirmationが6文字以上で英数混同であること" do
          
        end
      end

      context 'ユーザー新規登録がうまくいかないとき' do
        it "nicknameが空では登録できない" do
        
        end
        it "emailが空では登録できない" do
          
        end
        it "重複したemailが存在する場合登録できない" do
          
        end
        it "passwordが空では登録できない" do
          
        end
        it "passwordが5文字以下であれば登録できない" do

        end
        it "passwordが数字だけでは登録できない" do
          
        end
        it "passwordが英語だけでは登録できない" do
          
        end
        it "passwordが存在してもpassword_confirmationが空では登録できない" do
          
        end
        it "last_nameが空では登録できなこと" do
          
        end
        it "first_nameが空では登録できなこと" do
          
        end
        it "last_name_kanaが空では登録できなこと" do
          
        end
        it "first_name_kanaが空では登録できなこと" do
          
        end
        it "birth_dateが空では登録できなこと" do
          
        end
      end
    end
  end
end
