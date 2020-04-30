Rails.application.routes.draw do
  resources :products do
    resources :images, only: [:create, :show, :update, :destroy]
    resources :categorys, only: [:create, :show, :update, :destroy]
    resources :brands, only: [:create, :show, :update, :destroy]
  end
  resources :destinations, only: [:index, :edit, :update]
  root 'products#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destination'
    post 'destinations', to: 'users/registrations#create_destination'
  end


end
