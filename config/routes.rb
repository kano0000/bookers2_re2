Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  root to: 'homes#top'
  get 'home/about' => "homes#about"
  get "/search", to: "searches#search"
  get "tag_searches/search" => "tag_searches#search"
  
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
      get "posts_on_date" => "users#posts_on_date"
  end
  
  resources :chats, only: [:show, :create, :destroy]
  resources :groups, only: [:new, :index, :show, :create, :edit, :update] do
    resource :group_users, only: [:create, :destroy]
    resources :event_notices, only: [:new, :create]
    get "event_notices" => "event_notices#sent"
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end