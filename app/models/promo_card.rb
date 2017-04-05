class PromoCard < ActiveRecord::Base
  belongs_to :project
  belongs_to :essay
  has_one :image
end
