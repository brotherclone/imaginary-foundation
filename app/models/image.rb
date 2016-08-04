class Image < ActiveRecord::Base
  mount_uploader :file, PhotosUploader
  belongs_to :imageable, polymorphic: true
end
