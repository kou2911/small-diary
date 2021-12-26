require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
  before do
    @user = FactoryBot.build(:user)
  end

    context '新規登録できる場合' do
      it '全ての内容が存在している' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上の半角英数字混合になっている'do
        @user.password ='kouji1129'
        @user.password_confirmation = 'kouji1129'
        expect(@user).to be_valid
      end
    
    context '新規登録できない場合' do
      it 'nicknameが空だと登録できない' do
        @user.nickname =''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
        
      end

      it 'emailが空だと登録できない' do
        @user.email =''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
        
      end

      it 'emailが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")        
      end

      it 'eamilに@が含まれていないと登録できない' do
        @user.email = "aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
        
      end

      it 'passwordが空と登録できない' do
        @user.password =''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordが５文字以下だと登録できない' do
        @user.password ='kou11'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it 'passwordは数字だけだと登録できない' do
        @user.password ='000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it 'passwordが英語だけだと登録できない' do
        @user.password ='kkkkkkk'
        @user.valid?
        expect(@user.errors.full_messages).to include( "パスワードは不正な値です")
      end

      it 'passwordが全角文字を含むと登録できない' do
        @user.password ='ｚkou1111'
        @user.valid?
        expect(@user.errors.full_messages).to include( "パスワードは不正な値です")
      end

      it 'passwordがpassword_confirmationが不一致では登録できない' do
        @user.password ='aaa111'
        @user.password_confirmation = 'bbb222'
        @user.valid?
        expect(@user.errors.full_messages).to include( "パスワード（確認用）とパスワードの入力が一致しません")
      end






    end












    end
  end
end
