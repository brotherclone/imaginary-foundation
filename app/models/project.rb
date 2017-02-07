class Project < ActiveRecord::Base
  has_one :image
  has_one :gallery
end
