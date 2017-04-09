Rails.application.routes.draw do
  root to: 'home#intro'
  get '/about' => 'home#about'
  get '/profile/:id' => 'home#profile', as: :profile
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :pets
end
