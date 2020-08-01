Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  devise_for :users
  resources :books 
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
