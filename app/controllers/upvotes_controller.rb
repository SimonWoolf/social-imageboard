class UpvotesController < ApplicationController
  before_filter :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    current_user.upvote(@post)
    
    # :vote is the channel name. 'new' is the message name. both arbitrary
    # last param is the data you want to send. can be a string, an activerecord object, a hash, ...
    # here sending a hash
    WebsocketRails[:votes].trigger 'vote', {id: @post.id, upvotes: @post.upvotes.count}

    redirect_to posts_path
  end
end
