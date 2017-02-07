class Essay < ActiveRecord::Base
  has_one :image
  has_one :gallery
end
