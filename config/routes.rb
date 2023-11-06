Rails.application.routes.draw do
  get 'search', to: 'searches#search'
  get 'relationships/create'
  get 'relationships/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update,:new] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    member do
      post 'toggle_follow', to: 'users#toggle_follow'
      get 'followings', to: 'users#followings'
      get 'followers', to: 'users#followers'
    end
  end
  resources :users, only: [:index,:show,:edit,:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
