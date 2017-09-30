require "sidekiq/web"
Rails.application.routes.draw do
  get 'notifications/index'

  get 'search/create'
  get "posts/modal" => 'posts#modal', :as => :modal
  get "posts/modalShare" => 'posts#modalShare', :as => :modalShare
  get "posts/PhotoPostModal" => 'posts#PhotoPostModal', :as => :PhotoPostModal
  get "friendships/modalFriends" => 'friendships#modalFriends', :as => :modalFriends
  get "comments/moreComments" => 'comments#moreComments', :as => :modalComments
  
  resources :notifications, only: [:index,:update]
  
  resources :posts do
    resources :comments
    resources :likes
    resources :dislikes
    resources :shares
    member do
        post :repost
        post :modal
    end
    
  end

  resources :areas do
    resources :votes
  end


  resources :likes
  devise_for :users
  resources :usuarios, as: :users,only: [:show,:update]
  get '/changeArea' , to: 'main#changeArea'
  
  
  resources :friendships, only: [:create,:update,:index]
  resources :votes, only: [:create,:update,:index]
  
  
  authenticated :user do
  	root 'main#home'
  end

  unauthenticated :user do
  	root 'main#unregistered'
  end

  mount ActionCable.server => '/cable'
  mount Sidekiq::Web => '/sidekiq'

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
