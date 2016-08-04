require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should have_db_column(:title) }
  it { should have_db_column(:description) }
  it { should have_many(:images)}
  it 'has a vaild Factory' do
    expect(build(:project)).to be_valid
  end
end
