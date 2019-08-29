Rails.application.routes.draw do
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # URL 'welcome/home';
  # route to 'welcome' controller;
  # 'home' action;
  root 'pages#home'
  get 'about', to: 'pages#about'

  # V1
  # get 'welcome/home', to: 'welcome#home'
  # get 'welcome/about', to: 'welcome#about'
end
