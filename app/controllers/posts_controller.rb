class PostsController < ApplicationController
  POST_FIELDS = [:title, :body, :image]
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(params[:post].permit(POST_FIELDS))
    redirect_to '/posts'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(params[:post].permit(POST_FIELDS))
    redirect_to action: :show
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to action: :index
  end
end
