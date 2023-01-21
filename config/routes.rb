Rails.application.routes.draw do


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
}

  namespace :admin do
    get 'users' => 'users#index'
    resources :users, only: [:edit, :show, :update, :destroy]
    get 'articles' => 'articles#index'
    resources :articles, only: [:edit, :show, :update, :destroy]
  end



  devise_scope :user do
    root "public/sessions#new"
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :public do
    resources :users do
      member do
        get :following, :followers
        get "favorites" => "favorites#index"
      end
    end
    resources :relationships, only: [:create, :destroy]

    resources :articles do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end

    get "search" => "searches#search"
    get "search/result" => "searches#search"

  end

end