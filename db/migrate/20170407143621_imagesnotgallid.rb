class Imagesnotgallid < ActiveRecord::Migration
  def change
    remove_reference :images, :gallery
  end
end
