class Upvote < ActiveRecord::Base
  validates_uniqueness_of :post, scope: :user

  belongs_to :user
  belongs_to :post
end
