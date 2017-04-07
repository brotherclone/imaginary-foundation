class Fixpl < ActiveRecord::Migration
  def change
    remove_reference :gallery_images, :galleries
    add_reference :gallery_images, :gallery
  end
end
