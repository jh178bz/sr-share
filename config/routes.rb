Rails.application.routes.draw do
  devise_for :users,controllers: {
    registrations: 'users/registrations'
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
end
