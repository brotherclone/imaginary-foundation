class Project < ActiveRecord::Base
  has_one :image
  has_many :related_links
  accepts_nested_attributes_for :image
end
