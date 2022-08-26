Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show] do
    member do
    post "toggle_favorite", to: "products#toggle_favorite", as: :toggle_favorite
    end
  end
  resources :issues, only: [:index, :show]
  get "search", to: "pages#search"
  # Defines the root path route ("/")
  # root "articles#index"

  get "/favorites", to: "users#favorites", as: :favorites
end
