Rails.application.routes.draw do
  get "password_resets/new"

  # Authentication routes
  get 'sign_in' => 'sessions#new', as: 'sign_in'
  get 'sign_up' => 'users#new', as: 'sign_up'
  delete 'sign_out' => 'sessions#destroy', as: 'sign_out'
  post 'sessions' => 'sessions#create', as: 'sessions'
  post 'users' => 'users#create', as: 'users'
  # Users profile action
  get 'users/me' => 'users#me', as: 'my'
  # Home routes
  get 'index' => 'home#index', as: 'index'
  get 'about' => 'home#about', as: 'about'
  get 'contact' => 'home#contact', as: 'contact'

  resources :stories
  resources :password_resets

  namespace :api do
    namespace :v1 do
      # Authentication routes
      post 'users' => 'users#create', as: 'sign_up'
      post 'sessions' => 'sessions#create', as: 'sign_in'
      delete 'sessions' => 'sessions#destroy', as: 'sign_out'
      # Stories routes
      get 'stories' => 'stories#index', as: 'stories'
      post 'stories' => 'stories#create', as: 'story'
      post 'add' => 'stories#add', as: 'add_to_stories'
    end
  end

  root to: 'stories#index'
end
