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

  resources :users, only: :show do
    member do
      get :following, :followers
    end
  end
  resources :relationships,  only: [:create, :destroy]
  resources :items,          only: [:index, :show, :new, :create, :destroy] do
    resources :reviews,      only: [:show, :new, :create, :destory]
  end
  resources :categories,     only: [:new, :create, :destroy]


end
