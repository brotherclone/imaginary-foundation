class Image < ActiveRecord::Base
  mount_uploader :image_file, PhotosUploader
  belongs_to :project
  belongs_to :essay
  belongs_to :promo_card
end
