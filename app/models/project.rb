class Project < ActiveRecord::Base
  has_one :image
  has_one :gallery
  accepts_nested_attributes_for :image
end
