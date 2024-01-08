Rails.application.routes.draw do

  get 'groups/new'
  get 'groups/index'
  get 'groups/show'
  get 'groups/edit'
  get 'goups/new'
  get 'goups/index'
  get 'goups/show'
  get 'goups/edit'
  devise_for :users
  
  root to: 'homes#top'
  get 'home/about' => "homes#about"
  get "/search", to: "searches#search"
  
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
  resources :groups, only: [:new, :index, :show, :create, :edit, :update]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end