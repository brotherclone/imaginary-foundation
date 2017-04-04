require 'rails_helper'

RSpec.describe Image, type: :model do
  it 'should belong to an essay' do
    should belong_to(:essay)
  end
  it 'should belong to a project' do
    should belong_to(:project)
  end
end
