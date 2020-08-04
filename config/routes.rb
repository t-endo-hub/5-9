Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  devise_for :users
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users
  resources :relationships, only: [:create, :destroy]

  get '/search' => 'search#search', as: 'search'
  
  get 'users/:id/folow' => 'users#follow', as: 'follow'
  get 'users/:id/follower' => 'users#follower', as: 'follower'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
