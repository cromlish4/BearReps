Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :courses
  root 'courses#index'

  resources :scrapes
  get 'form' => 'courses#form'
end