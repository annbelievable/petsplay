Rails.application.routes.draw do
  root to: 'home#intro'
  get '/about' => 'home#about'
  get '/profile' => 'home#profile'
  post '/request_booking' => 'pets#request_booking'
  delete 'noted' => 'pets#noted'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :pets
end
