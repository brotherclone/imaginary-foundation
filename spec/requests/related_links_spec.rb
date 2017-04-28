require 'rails_helper'

RSpec.describe "RelatedLinks", type: :request do
  describe "GET /related_links" do
    it "works! (now write some real specs)" do
      get related_links_path
      expect(response).to have_http_status(200)
    end
  end
end
