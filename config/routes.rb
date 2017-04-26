Rails.application.routes.draw do
    root to: 'pages#home'                           # route for Home page
    devise_for :users, controllers: { registrations: 'users/registrations' }
    get 'about', to: 'pages#about'                  # route for About page
    resources :contacts, only: :create      # generatoes create paths for Contacts; resources :contacts => would create all paths for Contacts
    get 'contact-us', to: 'contacts#new', as: 'new_contact'  # custom url for Contact Us page; contacts#new -> contacts Controller, new Action
end
