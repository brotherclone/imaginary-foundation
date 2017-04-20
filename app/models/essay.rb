class Essay < ActiveRecord::Base
  has_one :image
  has_many :pull_quotes
end
