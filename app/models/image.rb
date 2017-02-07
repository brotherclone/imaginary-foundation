class Image < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :project
  belongs_to :essay
end
