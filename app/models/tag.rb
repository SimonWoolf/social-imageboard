class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts

  def to_s
    self.name
  end
end
