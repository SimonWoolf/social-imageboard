class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts

  before_validation(on: :create) do
    self.name = Tag.normalise(name)
  end
  validates_presence_of :name
  validates_uniqueness_of :name

  def to_s
    self.name
  end

  def find_or_create_normalised_from_tagstring(tagstring)
  end

  def self.normalise(name)
    name.downcase.gsub(/[^0-9a-z_-]/, '')
  end
end
