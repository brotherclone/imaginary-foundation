require 'rails_helper'

RSpec.describe RelatedLink, type: :model do
  it 'should belong to a project' do
    should belong_to(:project)
  end
end
