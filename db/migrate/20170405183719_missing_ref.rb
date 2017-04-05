class MissingRef < ActiveRecord::Migration
  def change
    add_reference :images, :promo_cards, index: :true
  end
end
