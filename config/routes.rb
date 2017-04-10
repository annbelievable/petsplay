Rails.application.routes.draw do
  root to: 'home#intro'
  get '/about' => 'home#about'
  get '/profile' => 'home#profile'

  resources :places, except: [:update, :edit, :destroy]

#   devise_for :users, controllers: { registrations: 'users/registrations' }

  get '/location' => 'location#index'

  post '/request_booking' => 'pets#request_booking'
  delete 'noted' => 'pets#noted'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :pets
end
