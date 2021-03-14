Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Default Route
  root 'pages#home'

  # Other Routes
  # get 'name' => 'viewName#name'
  get 'login' => 'pages#login'
  get 'new_profile' => 'pages#new_profile'
  get 'display_course' => 'pages#display_course'
  get 'display_profile' => 'pages#display_profile'
  # get 'courses' => 'pages#courses'
end
