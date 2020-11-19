Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :jewelleries, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
    get "listings"
    end
    resources :loans, only: [:new, :create]
  end
  resources :loans, only: [:index, :show, :destroy]

  get "/profile", to: "profile#profile"
end
