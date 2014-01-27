class Article < ActiveRecord::Base
  belongs_to :user

  has_many :upvotes
  has_many :upvoters, through: :upvotes, source: :user

  def creator
    user
  end
end
