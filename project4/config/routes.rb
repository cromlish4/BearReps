Rails.application.routes.draw do
  resources :sections
  resources :students
  resources :instructors
  resources :courses
  resources :scrapes
  # resources :applications
  resources :apps
  resources :recommendations
  # resources :pools
  #resources :users, constraints: { id: /.*/ }
  # devise_for :users
  Rails.application.routes.draw do
  resources :sections
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end

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
  #get 'admins/:nameDotNumber', to: 'admins#edit', as: :edit_admin
  get 'admins/all', to: 'admins#show' #, :as => :user
  get 'admins/index', to: 'admins#index'
  get 'admins/new', to: 'admins#new'


  get 'form' => 'courses#form'
  get 'new_course' => 'courses#form'
  get 'display_admin' => 'pages#display_admin'
  #This doesn't work can't have same as: as another route.
  #get 'admins/:name', to: 'admins#edit', as: :edit_admin
  #New admin page
  get 'admin_new' => 'admins#new'

  get 'admin/verify' => 'admins#verify'
  get 'admin/user', to: 'admins#verify_redirect'
  get 'admin/home' => 'admins#admin_home'
  get 'admin/verify.css' => 'admins#verify.css'

  # Admin Menu Updater
  patch 'admins/all' => 'admins#admins_all'

  # Admin User Menu
  get 'admin/users' => 'admins#users', :as => :admin_users
  get 'admin/users/show' => 'admin_user#show'
  get 'admin/users/edit' => 'admin_user#edit'
  get 'admin/users/index' => 'admin_user#index'


  # Admin Scraper Menu
  get 'admin/scraper' => 'admins#scrape_show'
  # Admin Grader Menu
  get 'admin/graders' => 'admins#graders'
  get 'admin/graders/show' => 'admin_grader#show'
  get 'admin/graders/edit' => 'admin_grader#edit'
  # patch 'admins/all' => 'admin_user#index'

  # Admin Approved Grader Menu
  get 'admin/app_graders' => 'admins#approved_graders'
  get 'admin/app_graders/show' => 'admin_approved_grader#show'
  get 'admin/app_graders/edit' => 'admin_approved_grader#edit'
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
  # get 'instructors_index' => 'instructors#index'

  get 'student_new' => 'students#new'
  #Edit student page
  #get 'student_edit' => 'students#edit'
  #Show a specific student
  # get 'student_show' => 'students#show'
  # Show all students
  # get 'students_index' => 'students#index'

  get 'courses' => 'pages#courses'

  #Scrapes
  get 'scrapes/index' => 'scrapes#index'
  get 'scrapes/new' => 'scrapes#new'

  # Profiles
  get 'student/profile' => 'pages#display_student'
  #get 'instructor/profile' => 'pages#display_admin'
  get 'admin/profile' => 'pages#display_admin'
  # CSS
  get 'display_student.css' => 'pages#display_student.css'
  #get 'instructor/profile' => 'pages#display_admin.css'
  get 'display_admin.css' => 'pages#display_admin.css'

  # Lists
  get 'all_students' => 'pages#all_students'
  get 'all_courses' => 'pages#all_courses'
  # CSS
  get 'all_students.css' => 'pages#all_students.css'
  get 'all_courses.css' => 'pages#all_courses.css'

  #Students
  get 'students/index' => 'students#index'
  get 'students/edit' => 'students#edit'
  get 'students/new' => 'students#new'
  get 'students/show' => 'students#show'

  #Users
  get 'users/index' => 'users#index'
  get 'users/edit' => 'users#edit'
  get 'users/new' => 'users#new'
  get 'users/show' => 'users#show'
  
  # Applications
  # Create an application
  get 'apps/new' => 'apps#new'
  # Edit an application
  get 'apps/edit' => 'apps#edit'
  # Show a specific application
  get 'apps/show' => 'apps#show'
  # Show all apps
  get 'apps/index' => 'apps#index'

  #Section extra
  get 'sections/all' => 'sections#all'
  resources :sections do
    get 'all'
  end

end
