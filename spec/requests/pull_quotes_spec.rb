require 'rails_helper'

RSpec.describe "PullQuotes", type: :request do
  describe "GET /pull_quotes" do
    it "works! (now write some real specs)" do
      get pull_quotes_path
      expect(response).to have_http_status(200)
    end
  end
end
