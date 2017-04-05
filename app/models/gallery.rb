class Gallery < ActiveRecord::Base
  has_many :images, through: :gallery_images
  belongs_to :project
  belongs_to :essay
end
