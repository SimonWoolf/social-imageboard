class UpvotesController < ApplicationController
  def create
    Upvote.create(user: current_user, article_id: params[:article_id])
    redirect_to articles_path
  end
end
