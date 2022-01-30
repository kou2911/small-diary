Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }  
   root to: 'diaries#index'
  resources :diaries do
    collection do
      get 'about'
      get 'privacy'
      get 'terms'
    end
  end

  resources :users, only: [:show, :edit, :update]
  resources :contacts, only: [:new, :create]
end
