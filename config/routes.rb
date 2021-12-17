Rails.application.routes.draw do
  resources :signups, only: [:create]
  resources :activities, only: %i[ index destroy]
  resources :campers, only: %i[index create show] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
