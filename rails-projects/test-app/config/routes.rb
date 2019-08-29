Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # URL 'welcome/home';
  # route to 'welcome' controller;
  # 'home' action;
  get 'welcome/home', to: 'welcome#home'
  get 'welcome/about', to: 'welcome#about'
end
