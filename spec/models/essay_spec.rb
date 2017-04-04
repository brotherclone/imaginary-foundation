require 'rails_helper'

RSpec.describe Essay, type: :model do
  it 'should have a title' do
    should have_db_column(:title)
  end
  it {should have_many(:pull_quotes)}
end
