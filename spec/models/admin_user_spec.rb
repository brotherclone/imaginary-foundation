require 'rails_helper'


RSpec.describe AdminUser, type: :model do
  it 'should have an email column' do
    should have_db_column(:email)
  end
end
