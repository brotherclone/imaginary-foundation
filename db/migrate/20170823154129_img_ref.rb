class ImgRef < ActiveRecord::Migration
  def change
    add_reference :projects, :images, index: true
    add_reference :essays, :images, index: true
    add_reference :promo_cards, :images, index: true
  end
end
