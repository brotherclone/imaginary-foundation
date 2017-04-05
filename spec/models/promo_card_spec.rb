require 'rails_helper'

RSpec.describe PromoCard, type: :model do
  it 'should belong to an essay' do
    should belong_to(:essay)
  end
  it 'should belong to a project' do
    should belong_to(:project)
  end
  it 'should have one image' do
    should have_one(:image)
  end
end
