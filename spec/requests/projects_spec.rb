require 'rails_helper'

RSpec.describe 'Projects', type: :request do
  describe 'GET /projects' do
    it 'gets the Project path' do
      get projects_path
      expect(response).to have_http_status(200)
    end
  end
end
