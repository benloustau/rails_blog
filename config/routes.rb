Rails.application.routes.draw do
  root 'users#index'

  resources :users do
    member do
      post 'follow'
      post 'unfollow'
     end
  end

  resources :posts do
    resources :comments, except: [:index, :new, :show]
  end

  resources :sessions, only: [:new, :create]
  delete '/logout', to: 'sessions#destroy'
  #delete '/post', to: 'posts#destroy'
end
