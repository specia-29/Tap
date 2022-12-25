Rails.application.routes.draw do

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
    resources :users
    get 'users/followed'
    get 'users/follower'
    get 'users/stat_update'
    get 'articles/like'
    get 'articles/top'
    resources :articles, only: [:new, :create, :show, :edit, :update, :destroy]
    get 'searches/user_search'
    get 'searches/article_search'
  end

end