class MissingRefReallyThisTime < ActiveRecord::Migration
  def change
    remove_reference :images, :promo_cards
    add_reference :images, :promo_card, index: :true
  end
end
