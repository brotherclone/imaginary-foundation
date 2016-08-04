require 'rails_helper'

RSpec.describe Image, type: :model do
  it { should have_db_column(:file) }
  it { should have_db_column(:caption) }
  it 'has a vaild Factory' do
    expect(build(:image)).to be_valid
  end
  it { should belong_to(:imageable) }
end
