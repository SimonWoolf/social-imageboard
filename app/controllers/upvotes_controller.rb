class UpvotesController < ApplicationController
  before_filter :authenticate_user!
  def create
    @article = Article.find(params[:article_id])
    current_user.upvote(@article)
    
    # :vote is the channel name. 'new' is the message name. both arbitrary
    # last param is the data you want to send. can be a string, an activerecord object, a hash, ...
    # here sending a hash
    WebsocketRails[:votes].trigger 'vote', {id: @article.id, upvotes: @article.upvotes.count}

    redirect_to articles_path
  end
end
