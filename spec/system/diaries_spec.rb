require 'rails_helper'

RSpec.describe "Diaries", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @diary =FactoryBot.build(:diary)
    @diary2 = FactoryBot.create(:diary)
  end

  context 'dairyが投稿できる時' do
    it 'ログインしたユーザーは新規投稿ができる' do
      #サインインをする
      sign_in(@user)
      #トップページに新規投稿に遷移するボタンがあることを確認する
      expect(page).to have_content('今日を投稿する')
      #投稿ページに遷移する
      visit new_diary_path
      #データを入力する
      fill_in 'diary-content',with: @diary.content
      fill_in 'diary-place',with: @diary.place
      image_path = Rails.root.join('public/images/test_image.png')
      attach_file('diary[image]', image_path, make_visible: true)
      #送信したデータがDBに保存されていることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change{Diary.count}.by(1)
      #マイページに遷移したことを確認する
      expect(current_path).to eq(user_path(@user.id))
      #マイページに先ほど投稿した内容が存在する
      expect(page).to have_content(@diary.content) 
      expect(page).to have_content(@diary.place)
      expect(page).to have_selector('img')
    end

    it 'ログインしたユーザーは画像がなくても新規投稿ができる' do
      #サインインをする
      sign_in(@user)
      #トップページに新規投稿に遷移するボタンがあることを確認する
      expect(page).to have_content('今日を投稿する')
      #投稿ページに遷移する
      visit new_diary_path
      #データを入力する
      fill_in 'diary-content',with: @diary.content
      fill_in 'diary-place',with: @diary.place
      #送信したデータがDBに保存されていることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change{Diary.count}.by(1)
      #マイページに遷移したことを確認する
      expect(current_path).to eq(user_path(@user.id))
      #マイページに先ほど投稿した内容が存在する
      expect(page).to have_content(@diary.content) 
      expect(page).to have_content(@diary.place)
    end
  end
  
  context 'diaryの投稿ができない時' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
    # トップページに遷移する
    visit root_path
    # 新規投稿ページへのボタンがないことを確認する
    expect(page).to have_no_content('今日を投稿する')
    end    
  end

  context 'diaryの編集ができる時' do
    it 'ログインしたユーザーで自分が投稿した内容' do
      #diary_secondを投稿したユーザーでログインする
      sign_in(@diary2.user)
      #マイページに遷移する
      visit user_path(@user.id)
      #diary_secondに編集ボタンがあることを確認する
      expect(page).to have_link '編集', href: edit_diary_path(@diary2)
      #編集ページへ遷移する
      visit edit_diary_path(@diary2)
      #すでに投稿済みの内容がフォームに入っていることを確認する
      expect(
        find('#diary-content').value
      ).to eq(@diary2.content)
      expect(
        find('#diary-place').value
      ).to eq(@diary2.place)
      #投稿内容の編集
      fill_in 'diary-content' ,with: @diary.content
      fill_in 'diary-place', with: @diary.place
      #編集してもdiaryモデルのカウントは変わらない
      expect{
        find('input[name="commit"]').click
      }.to change { Diary.count }.by(0)
      # 編集完了画面に遷移したことを確認する
      expect(current_path).to eq(user_path(@diary2.user))
    end
  end

  context 'diaryの編集ができない時' do
    it 'ログインしていないユーザーは編集ページに遷移できない' do
      #トップページに遷移する
      visit root_path
      #投稿一覧のボタンがないことを確認する
      expect(find('.toggle-box').click)
      expect(page).to have_no_content('投稿一覧')

    end
  end





end
