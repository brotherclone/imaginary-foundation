class CreatePromoCards < ActiveRecord::Migration
  def change
    create_table :promo_cards do |t|
      t.belongs_to :essay, index: true
      t.belongs_to :project, index: true
      t.timestamps
    end
    add_reference :promo_cards, :image, index: true
  end
end
