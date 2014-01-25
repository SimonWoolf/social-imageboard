class ArticlesController < ApplicationController
  ARTICLE_FIELDS = [:title, :link, :text]
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def update
  end

  def delete
  end

  def create
    Article.create(params[:article].permit(ARTICLE_FIELDS))
    redirect_to '/'
  end

  def edit

  end
end
