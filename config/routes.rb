Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  devise_for :users
  resources :books do
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users
  resources :relationships, only: [:create, :destroy]

  get '/search' => 'search#search', as: 'search'
  
  get 'users/:id/folow' => 'users#follow', as: 'follow'
  get 'users/:id/follower' => 'users#follower', as: 'follower'

  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
