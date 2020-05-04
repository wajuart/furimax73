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

  resources :users, only: [:show, :edit]

  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end

  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destination'
    post 'destinations', to: 'users/registrations#create_destination'
  end


end
