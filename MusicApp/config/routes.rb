Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:create, :update, :edit, :show, :destroy] do
    resources :tracks, only: [:new]
  end
  resources :tracks, only: [:create, :update, :edit, :show, :destroy]


end
