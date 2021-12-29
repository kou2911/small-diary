require 'rails_helper'
describe DiariesController, type: :request do

  before do
    @user = FactoryBot.create(:user)
    @diary = FactoryBot.create(:diary)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get root_path
      expect(response.status).to eq 200
    end
  end

  describe 'GET #new ' do
    context 'ログインしている場合'
    before do
      sign_in @user
    end
      it  'newアクションにリクエストすると正常にレスポンスが帰ってくる' do
         get new_diary_path
         expect(response.status).to eq 200
    end
   end

    context "ログインしていない場合" do
      it 'ログインページにリダイレクトされる' do
      get new_diary_path
      expect(response.status).to eq 302 
    end
  end




  describe 'GET #edit' do
    context 'ログインしている場合'
    before do
      sign_in @user
    end
      it  'newアクションにリクエストすると正常にレスポンスが帰ってくる' do
         get edit_diary_path(@diary.id)
         expect(response.status).to eq 200
    end
   end

    context "ログインしていない場合" do
      it 'ログインページにリダイレクトされる' do
      get edit_diary_path(@diary.id)
      expect(response.status).to eq 302 
    end
  end
end
