require 'rails_helper'

RSpec.describe Essay, type: :model do
  it { should have_db_column(:title) }
  it { should have_db_column(:description) }
  it { should have_db_column(:body) }
  it { should have_many(:images)}
  it 'has a vaild Factory' do
    expect(build(:essay)).to be_valid
  end
end
