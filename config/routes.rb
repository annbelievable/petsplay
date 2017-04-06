Rails.application.routes.draw do
  root to: 'home#intro'
  get '/about' => 'home#about'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :pets
end
