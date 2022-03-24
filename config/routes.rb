Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'
  
  # We can do this either with get or with resources
  # get 'users', to: 'users#index'
  # get 'users/:id', to: 'users#show'
  # get 'users/:user_id/posts', to: 'posts#index'
  # get 'users/:user_id/posts/:id', to: 'posts#show'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
