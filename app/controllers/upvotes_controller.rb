class UpvotesController < ApplicationController
  before_filter :authenticate_user!
  def create
    # :vote is the channel name. 'new' is the message name. both arbitrary
    # last param is the data you want to send. can be a string, an activerecord object, a hash, ...
    # here sending a hash
    WebsocketRails[:vote].trigger 'new', {id: @article.id, upvotes: @post.upvotes.count}

    current_user.upvote(Article.find(params[:article_id]))
    redirect_to articles_path
  end
end
