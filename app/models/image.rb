class Image < ActiveRecord::Base
  mount_uploader :image_file, PhotosUploader
  has_many :gallery_images
  belongs_to :project
  belongs_to :essay
  belongs_to :promo_card
end
