class Gallery < ActiveRecord::Base
  has_many :images
  belongs_to :project
  belongs_to :essay
end
