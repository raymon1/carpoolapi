Rails.application.routes.draw do
  resources :trips
  resources :users
  resources :places
  resources :groups
  post 'trips/:id/join', to: 'trips#join'
  post 'trips/:id/leave', to: 'trips#leave'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
