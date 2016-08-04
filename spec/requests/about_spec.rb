require 'rails_helper'

RSpec.describe 'About', type: :request do
  describe 'GET /about' do
    it 'gets the About path' do
      get about_path
      expect(response).to have_http_status(200)
    end
  end
end
