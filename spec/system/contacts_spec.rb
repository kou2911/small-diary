require 'rails_helper'

RSpec.describe "Contacts", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @contact = FactoryBot.build(:contact)
  end

  context 'お問い合わせができる時' do
    it 'ログインユーザーはお問い合わせができる' do
      #サインインする
      sign_in(@user)
      #トップページにお問い合わせボタンがあることを確認する
      find('.toggle-box').click
      expect(page).to have_content('お問い合わせ')
      #お問い合わせページに遷移する
      visit new_contact_path
      #データを入力する
      select 'バグ、不具合について' , from: 'genre_id'
      fill_in 'contact_memo' ,with: @contact.memo
      #送信するとcontactモデルのカウントが１上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change{Contact.count}.by(1)
      #トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
    end
  end
  
  context 'お問い合わせができない時' do
    it 'ログインユーザーが誤った情報を入力した時' do
      #サインインする
      sign_in(@user)
      #トップページにお問い合わせボタンがあることを確認する
      expect(find('.toggle-box').click)
      expect(page).to have_content('お問い合わせ')
      #お問い合わせページに遷移する
      visit new_contact_path
      #誤ったデータを入力する
      select 'バグ、不具合について' , from: 'genre_id'
      fill_in 'contact_memo' ,with: ''
      #送信してもcontactモデルのカウントは変わらない
      expect{
        find('input[name="commit"]').click
      }.to change{Contact.count}.by(0)
      #contactページに戻されることを確認する
      expect(current_path).to eq contacts_path
    end

    it 'ログインしていないユーザーはお問い合わせページに遷移できない' do
      #トップページに移動する
      visit root_path
      #お問い合わせページに遷移するボタンがないことを確認する
      find('.toggle-box').click
      expect(page).to have_no_content('お問い合わせ')
      
    end
  end

end
