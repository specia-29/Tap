class Admin::SearchesController < ApplicationController

  before_action :authenticate_admin!

  def search
    @range = params[:range]

    if @range == "ユーザー"
      @users = User.looks(params[:search], params[:word])
      render "admin/searches/search_result"
    else
      @articles = Article.looks(params[:search], params[:word])
      render "admin/searches/search_result"
    end
  end

end
