class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :tags

  has_attached_file :image, 
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    storage: :s3,
                    s3_credentials: {access_key_id: ENV['S3_ID'],
                                     secret_access_key: ENV['S3_SECRET']},
                    bucket: 'semw-instagram-clone'

  def tagstring=(tagstring)
    self.tags = tagstring.split(/[\s,]+/).map do |tag|
      Tag.find_or_create_by(name: Tag.normalise(tag))
    end
  end

  def tagstring
    self.tags.map(&:name).join(', ')
  end
end
