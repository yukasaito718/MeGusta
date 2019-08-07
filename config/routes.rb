Rails.application.routes.draw do

  get 'home/top'
  devise_for :makers, controllers: {
    sessions:      'makers/sessions',
    passwords:     'makers/passwords',
    registrations: 'makers/registrations'
  }

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  namespace :maker do
    resources :shops, only: [:index, :show]
    resources :makers, only: [:index, :show, :new, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    resources :users, only: [:create, :destroy]
  end

  namespace :admin do
    resources :users, only: [:edit, :update, :index, :show]
    resources :items, only: [:index, :show, :new, :edit, :create, :update, :destroy]
    resources :makers, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :shops, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  namespace :user do
    resources :shops, only: [:index, :show]
    resources :makers, only: [:index, :show]
    resources :items, only: [:index, :show]
    resources :users, only: [:create, :destroy]
  end

  # namespaceに属さないルーティング
  # get '/admin' => 'admin/homes#top'
  # get '/mypage', to: 'user/users#show'
  # get '/mypage/edit', to: 'user/users#edit'
  # patch '/user', to: 'user/users#update'
  # post '/user' , to: 'user/users#create'
 	root "user/home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end