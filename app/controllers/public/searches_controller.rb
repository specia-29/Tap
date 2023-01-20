class Public::SearchesController < ApplicationController

# public_search_path

  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "ユーザー"
      @users = User.looks(params[:search], params[:word])
      render "public/searches/search_result"
    else
      @articles = Article.looks(params[:search], params[:word])
      render "public/searches/search_result"
    end
  end

end
