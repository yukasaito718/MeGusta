Rails.application.routes.draw do
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
    resources :shops
    resources :makers
    resources :items
  end

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :items
    resources :makers
    resources :shops
    resources :categories
  end

  scope module: :user do
    resources :shops, only: [:index, :show]
    resources :makers, only: [:index, :show]

    resources :categories, only: [:index] do
      resources :items, only: [:index]
    end

    resources :items, only: [:index, :show] do
      resources :comments
      post '/favorites' =>'favorites#create', as: :favorites
      delete '/favorites' => 'favorites#destroy', as: :favorite
    end

    resources :users, only: [:create, :destroy]
    patch 'users/:id' => 'users#update'
    get "/mypage" => 'users#show'
    get "/users/:id/edit" => 'users#edit', as: 'user_edit'
  end

  # namespaceに属さないルーティング
  # get '/admin' => 'admin/homes#top'
  # get '/mypage', to: 'user/users#show'
  # get '/mypage/edit', to: 'user/users#edit'
  # patch '/user', to: 'user/users#update'
  # post '/user' , to: 'user/users#create'

 	# ユーザーのトップページ・マイページshow,editのルーティング
  root "user/homes#top"
  post '/user' => 'user/users#create'
  # メーカーのトップページ・マイページshow,editのルーティング
  get '/maker' => "maker/homes#top"
  get "/makerpage" => 'maker/makers#show'
  get "/makerpage/edit" => 'maker/makers#edit'
  patch '/maker' => 'maker/makers#update'
  post '/maker' => 'maker/makers#create'

  # 管理側のトップページルーティング
  get '/admin' => "admin/homes#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end