class ArticlesController < ApplicationController
  def index
    @articles = Article.published_now.page(params[:page]).per(4)
    respond_to :html, :js
  end

  def show
    @article = Article.published_now.find(params[:id])
  end
end
