require 'rails_helper'

RSpec.describe PullQuote, type: :model do
  it 'should belong to an essay' do
    should belong_to(:essay)
  end
end
