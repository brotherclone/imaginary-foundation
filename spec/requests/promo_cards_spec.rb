require 'rails_helper'

RSpec.describe "PromoCards", type: :request do
  describe "GET /promo_cards" do
    it "works! (now write some real specs)" do
      get promo_cards_path
      expect(response).to have_http_status(200)
    end
  end
end
