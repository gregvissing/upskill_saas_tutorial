Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: 'pages#home'                           # route for Home page
    get 'about', to: 'pages#about'                  # route for About page
    resources :contacts, only: [:create]      # generatoes create paths for Contacts; resources :contacts => would create all paths for Contacts
    
    get 'contact-us', to: 'contacts#new', as: 'new_contact'  # custom url for Contact Us page; contacts#new -> contacts Controller, new Action
end
