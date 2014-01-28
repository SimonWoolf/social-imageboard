class PostsController < ApplicationController
  POST_FIELDS = [:title, :body, :image, :tagstring, :link]
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy] 
  before_filter :authenticate_post_creator, only: [:edit, :update, :destroy] 

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(params[:post].permit(POST_FIELDS))
    redirect_to '/posts'
  end

  def edit
  end

  def update
    @post.update(params[:post].permit(POST_FIELDS))
    redirect_to action: :show
  end

  def destroy
    @post.destroy
    redirect_to action: :index
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def authenticate_post_creator
    if @post.user != current_user
      flash[:alert] = "Only the post creator can edit or delete their post"
      redirect_to posts_path
    end
  end
end
