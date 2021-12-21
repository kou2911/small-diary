Rails.application.routes.draw do
  devise_for :users
  root to: 'diaries#index'
  resources :diaries do
    collection do
      get 'about'
    end
  end

  resources :users, only: [:show, :edit, :update]
end
