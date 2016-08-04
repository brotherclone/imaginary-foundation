require 'rails_helper'

RSpec.describe 'Topics', type: :request do
  describe 'GET /topics' do
    it 'gets the Topics path' do
      get topics_path
      expect(response).to have_http_status(200)
    end
  end
end
