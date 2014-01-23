class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments << Comment.create(params[:comment].permit(:name, :text))
    redirect_to post_path(@post)
  end
end
