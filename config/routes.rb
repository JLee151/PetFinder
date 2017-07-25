Rails.application.routes.draw do
	devise_for :users
	root to: 'pages#home'
	get 'about', to:'pages#about'
	resources :contacts, only: :create
	get 'contact-me', to:'contacts#new', as: 'new_contact'
end