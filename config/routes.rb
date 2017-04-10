Rails.application.routes.draw do
  root to: 'home#intro'
  get '/about' => 'home#about'
  get '/profile' => 'home#profile'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :places, except: [:update, :edit, :destroy]

  get '/location' => 'location#index'
  resources :pets
end
