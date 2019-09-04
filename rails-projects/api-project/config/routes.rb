Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  post 'login', to: 'authentication#login'
  post 'refresh', to: 'authentication#refresh'
  post 'verify', to: 'authentication#verify'
  namespace :v1 do
    resources :contacts
    resources :users
    resources :roles
    resources :categories, except: [:destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
