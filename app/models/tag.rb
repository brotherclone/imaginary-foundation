class Tag < ActiveRecord::Base
  belongs_to :topic
  belongs_to :essay
  belongs_to :project
end
