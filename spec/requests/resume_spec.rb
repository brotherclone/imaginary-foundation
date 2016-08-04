require 'rails_helper'

RSpec.describe 'Resume', type: :request do
  describe 'GET /resume' do
    it 'gets the Resume path' do
      get resume_path
      expect(response).to have_http_status(200)
    end
  end
end
