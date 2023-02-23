Rails.application.routes.draw do
  get 'bookmarks/new'
  get 'lists/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end

  # resources :bookmarks, only: [:destroy]
end

# config/routes.rb
Rails.application.routes.draw do
  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end
end
