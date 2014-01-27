class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
  has_many :upvotes
  has_many :upvoted, through: :upvotes, source: :article

  def upvote(article)
    article.upvoters << self
  end
end
