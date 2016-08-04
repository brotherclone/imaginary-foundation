require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { should belong_to(:topic) }
  it { should belong_to(:essay) }
  it { should belong_to(:project)}
  it 'has a vaild Factory' do
    expect(build(:tag)).to be_valid
  end
end
