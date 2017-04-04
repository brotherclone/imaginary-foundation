require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'should have a title' do
    should have_db_column(:title)
  end
end
