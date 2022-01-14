Rails.application.routes.draw do
  
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  resources :books, only: [:index, :show, :edit]
  devise_for :users
  root to: "homes#top"
  get 'homes/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
