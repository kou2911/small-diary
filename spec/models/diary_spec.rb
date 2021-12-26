require 'rails_helper'

RSpec.describe Diary, type: :model do
  describe '#create' do
    before do
      @diary = FactoryBot.build(:diary)
    end

    context '新規投稿できる場合' do
      it '全ての値が存在する' do
        expect(@diary).to be_valid
      end

      it '画像がなくても投稿できる' do
        @diary.image = nil
        expect(@diary).to be_valid
      end
    end


    context '新規投稿ができない場合' do
      it 'contentが空だと投稿できない' do
        @diary.content = ''
        @diary.valid?
        expect(@diary.errors.full_messages).to include("内容を入力してください")
      end

      it 'placeが空だと投稿できない' do
        @diary.place = ''
        @diary.valid?
        expect(@diary.errors.full_messages).to include("場所を入力してください")
        
      end

      it 'userが紐付いていないと保存できないこと' do
        @diary.user = nil
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Userを入力してください")
        
      end

      it 'contentが15文字より多いと保存できないこと' do
        @diary.content = "aaaaaaaaaaaaaaaaa"
        @diary.valid?
        expect(@diary.errors.full_messages).to include("内容は15文字以内で入力してください")
      end

      it 'placeが30文字より多いと保存できないこと' do
        @diary.place = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        @diary.valid?
        expect(@diary.errors.full_messages).to include("場所は30文字以内で入力してください")
      end
    end
  end
end
