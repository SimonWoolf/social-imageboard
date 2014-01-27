class Upvote < ActiveRecord::Base
  validates_uniqueness_of :article, scope: :user

  belongs_to :user
  belongs_to :article
end
