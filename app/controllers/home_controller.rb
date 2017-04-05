class HomeController < ApplicationController
  def index
    @promo_cards = PromoCard.all
    gon.watch.promo_cards=  @promo_cards
  end
end
