Rails.application.routes.draw do
  root to: 'home#intro'
  get '/about' => 'home#about'
  get '/profile' => 'home#profile'


  resources :places, except: [:update, :edit, :destroy]

#   devise_for :users, controllers: { registrations: 'users/registrations' }

  get '/location' => 'location#index'
  post 'favourite!' => 'pets#favourite!'

  post '/approve_booking' => 'home#approve_booking'
  post '/reject_booking' => 'home#reject_booking'
  resources :pets
  post '/request_booking' => 'pets#request_booking'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

end
