Rails.application.routes.draw do

  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end

  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/followed'
    get 'users/follower'
    get 'users/stat_update'
    get 'searches/user_search'
    get 'searches/article_search'
    get 'articles/top'
    get 'articles/new'
    get 'articles/create'
    get 'articles/show'
    get 'articles/edit'
    get 'articles/update'
    get 'articles/destroy'
    get 'articles/like'
  end

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"

}end