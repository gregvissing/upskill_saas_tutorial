Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'           # route for Home page
  get 'about', to: 'pages#about'  # route for About page
  resources :contacts
end
