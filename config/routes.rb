Rails.application.routes.draw do
  devise_for :users,controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root 'static_pages#home'
  get :about,   to: 'static_pages#about'
  get :terms,   to: 'static_pages#terms'

  post 'favorites/:item_id/create',   to: 'favorites#create'
  delete 'favorites/:item_id/destroy', to: 'favorites#destroy'

  resources :users, only: :show do
    member do
      get :following, :followers, :favorites
    end
  end
  resources :relationships,  only: [:create, :destroy]
  resources :items,          only: [:index, :show, :new, :create, :destroy] do
    resources :reviews,      only: [:show, :new, :create, :destroy] do
      post :confirm, action: :confirm_new, on: :new
    end
  end
  resources :categories,     only: [:new, :create, :destroy]


end
