require 'rails_helper'

RSpec.describe HomeHelper, type: :helper do
  describe 'Utilites' do
    it 'checks the returning yearc' do
      today = Date.today
      check = today.strftime('%Y').to_s
      expect(helper.this_year).to eq(check)
    end
  end
end
