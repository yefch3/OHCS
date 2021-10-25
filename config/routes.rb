Rails.application.routes.draw do
  resources :messages
  resources :rooms
  get '/dashboard', to: 'rooms#dashboard'
  get '/rooms/:id/chat', to: 'rooms#room'
  devise_for :doctors
  get '/doctors/:id/profile', to: 'doctors#profile' 
  devise_for :patients
  get '/patients/:id/profile', to: 'patients#profile' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root controller: :rooms, action: :index
end
