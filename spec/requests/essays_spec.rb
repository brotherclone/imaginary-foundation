require 'rails_helper'

RSpec.describe "Essays", type: :request do
  describe "GET /essays" do
    it "works! (now write some real specs)" do
      get essays_path
      expect(response).to have_http_status(200)
    end
  end
end
