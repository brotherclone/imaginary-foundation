class Gallery < ActiveRecord::Base
  has_many :gallery_images, dependent: :destroy
  has_many :images, through: :gallery_images
  accepts_nested_attributes_for :gallery_images
  belongs_to :project
  belongs_to :essay
end
