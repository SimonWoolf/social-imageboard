class UpvotesController < ApplicationController
  def create
    current_user.upvote(Article.find(params[:article_id]))
    redirect_to articles_path
  end
end
