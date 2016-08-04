require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'GET /home' do
    it 'gets the Home path' do
      get home_path
      expect(response).to have_http_status(200)
    end
  end
  describe 'GET /' do
    it 'gets the root path' do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
