Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :jewelleries, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :loans, only: [:new, :create]
  end
  resources :loans, only: [:show, :destroy]
end
