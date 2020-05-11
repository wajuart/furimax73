Rails.application.routes.draw do
  resources :products do
    resources :images, only: [:create, :show, :update, :destroy]
    resources :categorys, only: [:create, :show, :update, :destroy]
    resources :brands, only: [:create, :show, :update, :destroy]
    collection do
      get 'search'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'purchase/:id'=> 'products#purchase', as: 'purchase'          #購入確認ページ
      post 'pay/:id'=> 'products#pay', as: 'pay'                        #httpメソッドはpostなので注意
      get 'done/:id'=> 'products#done', as: 'done'                      #購入完了ページ
    end
  end
  resources :destinations, only: [:index, :edit, :update]
  root 'products#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
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
