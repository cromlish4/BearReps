Rails.application.routes.draw do
  resources :students
  resources :instructors
  resources :courses
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Default Route
  root 'pages#home'

  # Other Routes
  # get 'name' => 'viewName#name'
  # get 'login' => 'pages#login'
  get 'login.css' => 'pages#login.css'
  # get 'new_profile' => 'pages#new_profile'
  get 'new_profile.css' => 'pages#new_profile.css'
  get 'display_course' => 'pages#display_course'
  get 'display_profile' => 'pages#display_profile'
  get 'admins/:name', to: 'admins#edit', as: :edit_admin
  get 'form' => 'courses#form'
  get 'new_course' => 'courses#form'
  # get 'courses' => 'pages#courses'

end
