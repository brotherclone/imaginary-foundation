class Ind < ActiveRecord::Migration
  def change
    add_index :gallery_images, :gallery_id
    add_index :gallery_images, :image_id
  end
end
