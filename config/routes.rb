Rails.application.routes.draw do

  devise_for :users

  get 'home/index'


  devise_scope :user do
    authenticated :user do
      get '/likes/:id', to: 'home#Likes', as: 'likes'
      root 'home#index', as: :authenticated_root
      resources :images
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end



end
