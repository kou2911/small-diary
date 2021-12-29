require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe '#create' do
    before do
      @contact = FactoryBot.build(:contact)
    end

    context 'お問い合わせメールが送ることが可能な場合' do
      it '全ての値が存在する' do
        expect(@contact).to be_valid
      end
    end

    context 'お問い合わせメールが送れない場合'   do
      it 'genreが空だと送信できない' do
        @contact.genre_id = ''
        @contact.valid?
        expect(@contact.errors.full_messages).to include("ジャンル値が空です")
      end

      it 'memoが空だと送信できない' do
        @contact.memo = ''
        @contact.valid?
        expect(@contact.errors.full_messages).to include("内容を入力してください")
      end
    end
  end
end
