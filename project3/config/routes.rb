Rails.application.routes.draw do
  resources :students
  resources :instructors
  resources :courses
  resources :scrapes
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Default Route
  root 'pages#home'
  # Other Routes
  # get 'name' => 'viewName#name'
  # get 'login' => 'pages#login'
  get 'login.css' => 'pages#login.css'
  get 'home' => 'pages#home'
  # get 'new_profile' => 'pages#new_profile'
  get 'new_profile.css' => 'pages#new_profile.css'
  get 'display_course' => 'pages#display_course'
  get 'display_profile' => 'pages#display_profile'
  get 'admins/:nameDotNumber', to: 'admins#edit', as: :edit_admin
  get 'admins_all', to: 'admins#show', :as => :user
  get 'admins_index', to: 'admins#index'
  get 'admins_new', to: 'admins#new'

  get 'form' => 'courses#form'
  get 'new_course' => 'courses#form'
  get 'display_admin' => 'pages#display_admin'
  #This doesn't work can't have same as: as another route.
  #get 'admins/:name', to: 'admins#edit', as: :edit_admin
  #New admin page
  get 'admin_new' => 'admins#new'
  #Edit admin page
  #get 'admin_edit' => 'admins#edit'
  #Show a specific admin
  # get 'admin_show' => 'admins#show'
  # Show all admins
  # get 'admins_index' => 'admins#index'

  get 'instructor_new' => 'instructors#new'
  #Edit instructor page
  #get 'instructor_edit' => 'instructors#edit'
  #Show a specific instructor
  # get 'instructor_show' => 'instructors#show'
  # Show all instructors
  # get 'instructors_index' => 'instrutors#index'

  get 'student_new' => 'students#new'
  #Edit student page
  #get 'student_edit' => 'students#edit'
  #Show a specific student 
  # get 'student_show' => 'students#show'
  # Show all students
  # get 'students_index' => 'students#index'

  get 'courses' => 'pages#courses'

  #Scrapes
  get 'scrapes/index', to: 'scrapes#index'
  get 'scrapes/new', to: 'scrapes#new'


end
