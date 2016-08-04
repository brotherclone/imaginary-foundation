class Topic < ActiveRecord::Base
  has_many :tags
  has_many :essays, through: :tags
  has_many :projects, through: :tags
end
