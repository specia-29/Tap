Rails.application.routes.draw do

  devise_scope :public do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
    get 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
}

  namespace :admin do
    resources :users, only: [:edit, :index, :show, :update]
  end

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :public do
    # root :to => 'articles#index'
    resources :users
    get 'users/followed'
    get 'users/follower'
    get 'users/stat_update'

    resources :articles do
      post 'add' => 'likes#create'
      delete '/add' => 'likes#destroy'
      resources :comments, only: [:create, :destroy]
    end

    get "search" => "searches#search"
    get "search/result" => "searches#search"


  end

end