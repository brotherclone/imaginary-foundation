require 'rails_helper'

RSpec.describe "Goodwords", type: :request do
  describe "GET /goodwords" do
    it "works! (now write some real specs)" do
      get goodwords_path
      expect(response).to have_http_status(200)
    end
  end
end
