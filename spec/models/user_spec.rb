require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全ての内容が存在している' do
        
      end
      it 'passwordが6文字以上の半角英数字混合'do
        
      end
    end
    













  end
end
