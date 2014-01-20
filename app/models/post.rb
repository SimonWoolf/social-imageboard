class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  has_attached_file :image, 
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    storage: :s3,
                    s3_credentials: {access_key_id: ENV['S3_ID'],
                                     secret_access_key: ENV['S3_SECRET']},
                    bucket: 'semw-instagram-clone'
end
