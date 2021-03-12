Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Default Route
  root 'index#index'

  # Other Routes
  # get 'name' => 'viewName#name'
  get 'login' => 'pages#login'
  get 'new_profile' => 'pages#new_profile'
end
