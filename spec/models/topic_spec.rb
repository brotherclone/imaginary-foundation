require 'rails_helper'

RSpec.describe Topic, type: :model do
  it { should have_db_column(:title) }
  it { should have_db_column(:description) }
  it { should have_many(:tags)}
  it 'has a vaild Factory' do
    expect(build(:tag)).to be_valid
  end
end
