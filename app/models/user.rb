class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  has_many :posts
  has_many :upvotes
  has_many :upvoted, through: :upvotes, source: :post

  def upvote(post)
    if post.upvoters.include? self
      Upvote.find_by(user: self, post: post).destroy
    else
      post.upvoters << self
    end
  end
end
