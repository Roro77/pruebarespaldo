Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root 'tweets#index'

  resources :tweets do
    post 'like', to:'tweets#like'
    post 'retweet', to:'tweets@retweet'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
