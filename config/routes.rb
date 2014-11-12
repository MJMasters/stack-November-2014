Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'comments/new'

 	 resources :stories do
  	 	resources :votes, only: [:create]
  	 	resources :comments, only: [:new, :create]
	end

  root "stories#index"

end
