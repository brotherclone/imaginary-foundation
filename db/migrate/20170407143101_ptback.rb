class Ptback < ActiveRecord::Migration
  def change
    add_reference :gallery_images, :image
  end
end
