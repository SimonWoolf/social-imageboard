class ArticlesController < ApplicationController
  ARTICLE_FIELDS = [:title, :link, :text]
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy] 
  
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def update
    @article.update(params[:article].permit(ARTICLE_FIELDS))
    redirect_to article_path(@article)
  end

  def create
    Article.create(params[:article].permit(ARTICLE_FIELDS))
    redirect_to '/'
  end

  def edit
  end

  def detroy
    @article.destroy
    redirect_to articles_path
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
