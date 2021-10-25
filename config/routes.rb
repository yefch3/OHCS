Rails.application.routes.draw do
  resources :messages
  resources :rooms
  devise_for :doctors
  devise_for :patients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root controller: :rooms, action: :index
end
