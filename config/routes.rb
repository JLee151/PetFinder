Rails.application.routes.draw do
    root to: 'pages#home'
    get 'about', to:'pages#about'
    resources :contacts
    get 'contact-me', to:'contacts#new'
end
