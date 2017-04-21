require 'rails_helper'

RSpec.describe "RelatedLinks", type: :request do
  describe 'should have a path'do
    it 'has a path' do
      get related_links_path
      expect(response).to have_http_status(200)
    end
  end
end
