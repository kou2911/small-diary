require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user_second = FactoryBot.build(:user)
    @user = FactoryBot.create(:user)
  end

  context 'ユーザー新規登録ができる時' do
    it '正しい情報を入力すればユーザー新規登録ができトップページに遷移する' do
      #トップページに移動する
      visit root_path
      #トップページに新規登録ページに遷移するボタンがあることを確認する
      expect(find('.toggle-box').click)
      expect(page).to have_content('新規登録')
      #新規登録ページに移動する
      visit new_user_registration_path
      #ユーザー情報を入力する
      fill_in 'ニックネーム', with: @user_second.nickname
      fill_in 'メールアドレス', with: @user_second.email
      fill_in 'パスワード', match: :first, with: @user_second.password
      fill_in 'パスワード(確認)',match: :first, with: @user_second.password_confirmation
      #サインアップボタンを押すとユーザーモデルのカウントが１上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change {User.count}.by(1)
      #トップページに遷移したことを確認する
      expect(current_path).to eq(root_path)
      #トップページにログアウトボタンが表示されることを確認する
      expect(find('.toggle-box').click)
      expect(page).to have_content('ログアウト')
      #サインアップページへの遷移ボタン、ログインページへの遷移ボタンが表示されていないことを確認する
      expect(find('.toggle-box').click)
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
      end
  end
  
  context 'ユーザー新規登録ができない場合' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      #トップページに移動する
      visit root_path
      #トップページに新規登録ページに遷移するボタンがあることを確認する
      expect(find('.toggle-box').click)
      expect(page).to have_content('新規登録')
      #新規登録ページに移動する
      visit new_user_registration_path
      #ユーザー情報を入力する
      fill_in 'ニックネーム',with: ''
      fill_in 'メールアドレス', with:''
      fill_in 'パスワード',match: :first, with:''
      fill_in 'パスワード(確認)', match: :first, with: ''
      #サインアップボタンを押してもユーザーモデルのカウントが上がらないこと確認する
      expect{
        find('input[name="commit"]').click
      }.to change {User.count}.by(0)
      #新規登録ページへ戻されることを確認する
      expect(current_path).to eq user_registration_path
    end
  end

  context 'ユーザーログインができる時' do
    it '正しい情報を入力すればユーザーログインができトップページに遷移する'do
      #トップページに移動する
      visit root_path
      #トップページにログインページに遷移するボタンがあることを確認する
      expect(find('.toggle-box').click)
      expect(page).to have_content('ログイン')
      #ログインページに移動する
      visit  new_user_session_path
      #すでに保存されているデータを入力する
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password     
      #ログインボタンをクリックする
      click_on('Create Account')
      #トップページに遷移していることを確認する
      expect(current_path).to eq(root_path)
    end
  end
  context 'ユーザーログインができない時' do
    it '誤った情報を入力すればユーザーログインができずログインページのままになる' do
    #トップページに遷移する
    visit root_path
    #トップページにログインページに遷移するボタンがあることを確認する
    expect(find('.toggle-box').click)
    expect(page).to have_content('ログイン')
    #ログインページに移動する
    visit new_user_session_path
    #誤ったユーザー情報を入力する
    fill_in 'メールアドレス',with: 'test'
    fill_in 'パスワード',with: 'test'
    #ログインボタンをクリックする
    click_on('Create Account')
    #サインインページに戻ってきていることを確認する
    expect(current_path).to eq(new_user_session_path)
  end
 end
end
