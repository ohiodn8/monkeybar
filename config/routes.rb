Rails.application.routes.draw do
  resources :posts
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :bedrooms
  resources :locations
  resources :properties
  
  match '/contacts',     to: 'contacts#new',             via: 'get'
resources "contacts", only: [:new, :create]

  root 'properties#index'

  

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end
end
