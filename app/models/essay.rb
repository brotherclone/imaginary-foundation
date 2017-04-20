class Essay < ActiveRecord::Base
  has_one :image
  has_one :gallery
  has_many :pull_quotes
end
