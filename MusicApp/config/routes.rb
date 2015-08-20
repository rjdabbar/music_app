Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :index] do
    member do
      get 'activate'
    end
  end

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:create, :update, :edit, :show, :destroy] do
    resources :tracks, only: [:new]
  end

  resources :tracks, only: [:create, :update, :edit, :show, :destroy]

  resources :notes, only: [:new, :create, :destroy]


end
