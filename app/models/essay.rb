class Essay < ActiveRecord::Base
  has_many :images, as: :imageable
  has_many :tags
  has_many :topics, through: :tags
end
