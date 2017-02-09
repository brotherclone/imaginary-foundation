class Image < ActiveRecord::Base
  mount_uploader :image_file, PhotosUploader
  belongs_to :gallery
  belongs_to :project
  belongs_to :essay
end
