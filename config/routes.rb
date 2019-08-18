Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
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
    resources :shops, only: [:index, :show, :new, :edit, :create, :update, :destroy]
    resources :makers, only: [:index, :show, :new, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :items, only: [:index, :show, :new, :edit, :create, :update, :destroy]
    resources :makers, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :shops, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  namespace :user do
    resources :shops, only: [:index, :show]
    resources :makers, only: [:index, :show]
    resources :items, only: [:index, :show] do
      resources :comments
    end
    resources :users, only: [:create, :destroy]
    patch 'users/:id' => 'users#update'
    get "/mypage" => 'users#show'
    get "/users/:id/edit" => 'users#edit', as: 'user_edit'
  end

  resources :favorites, only: [:create, :destroy]

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