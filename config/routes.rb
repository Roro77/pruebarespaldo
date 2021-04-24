Rails.application.routes.draw do
  get 'api/news', to: 'api#index'
  get 'api/:start_date/:end_date', to: 'api#by_date'
  post 'api/tweets', to: 'api#create'


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root 'tweets#index'
  get 'tweets/friends'
  get 'tweets/followers'
  get '/tweets/hashtag/:name', to: 'tweets#hashtags'

  resources :tweets do
    post 'like', to:'tweets#like'
    post 'retweet', to:'tweets@retweet'
    post :friend
  end
end


